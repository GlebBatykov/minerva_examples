import 'package:minerva/minerva.dart';

import '../apis/notes_api.dart';

class ApisBuilder extends MinervaApisBuilder {
  @override
  List<Api> build() {
    return [NotesApi()];
  }
}
