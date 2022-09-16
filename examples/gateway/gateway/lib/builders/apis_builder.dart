import 'package:minerva/minerva.dart';

import '../apis/auth_api.dart';

class ApisBuilder extends MinervaApisBuilder {
  @override
  List<Api> build() {
    return [AuthApi()];
  }
}
