import 'package:minerva/minerva.dart';

import '../apis/file_api.dart';

class ApisBuilder extends MinervaApisBuilder {
  @override
  List<Api> build() {
    return [FileApi()];
  }
}
