import 'package:minerva/minerva.dart';

import '../apis/web_socket_api.dart';

class ApisBuilder extends MinervaApisBuilder {
  @override
  List<Api> build() {
    return [WebSocketApi()];
  }
}
