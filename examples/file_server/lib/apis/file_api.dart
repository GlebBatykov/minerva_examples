import 'dart:io';

import 'package:minerva/minerva.dart';
import 'package:path/path.dart';

import '../core/random_string_generator.dart';

class FileApi extends Api {
  late final String _folderPath;

  @override
  Future<void> initialize(ServerContext context) async {
    var configuration = ConfigurationManager();

    await configuration.load();

    _folderPath =
        '${HostEnvironment.contentRootPath}${configuration['folder']}';
  }

  @override
  void build(Endpoints endpoints) {
    var uploadFilter = RequestFilter(
        body: FormFilter(fields: [FormField('file', FormFieldType.file)]));

    var downloadFilter = RequestFilter(
        queryParameters: QueryParametersFilter(
            parameters: [QueryParameter(name: 'fileName')]));

    endpoints.post('/upload', _upload, filter: uploadFilter);

    endpoints.get('/download', _download, filter: downloadFilter);
  }

  dynamic _upload(ServerContext context, MinervaRequest request) async {
    var form = await request.body.asForm();

    var field = (form.data['file'] as FormDataFile);

    var file = await _getFileToWrite(field.name);

    await file.create(recursive: true);

    await file.writeAsBytes(field.bytes);

    var fileName = basename(file.path);

    return {'fileName': fileName};
  }

  Future<File> _getFileToWrite(String fileName) async {
    var file = File.fromUri(Uri.parse('$_folderPath/$fileName'));

    if (await file.exists()) {
      var fileExtension = extension(fileName);

      var stringGenerator = RandomStringGenerator();

      do {
        fileName = stringGenerator.generate(12);

        if (fileExtension.isNotEmpty) {
          fileName += fileExtension;
        }

        file = File.fromUri(Uri.parse('$_folderPath/$fileName'));
      } while (await file.exists());
    }

    return file;
  }

  dynamic _download(ServerContext context, MinervaRequest request) async {
    var fileName = request.uri.queryParameters['fileName'];

    var file = File.fromUri(Uri.parse('$_folderPath/$fileName'));

    if (!await file.exists()) {
      return NotFoundResult(body: 'File not exist');
    }

    return FileResult(file);
  }
}
