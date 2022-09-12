import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:minerva/minerva.dart';

class AuthApi extends Api {
  late final SecretKey _key;

  @override
  Future<void> initialize(ServerContext context) async {
    var configuration = ConfigurationManager();

    await configuration.load();

    _key = SecretKey(configuration['secret']);
  }

  @override
  void build(Endpoints endpoints) {
    var filter = Filter(
        body: JsonFilter(fields: [
      JsonField(name: 'username', type: JsonFieldType.string),
      JsonField(name: 'role', type: JsonFieldType.string)
    ]));

    endpoints.post('/auth', _auth, filter: filter);
  }

  dynamic _auth(ServerContext context, MinervaRequest request) async {
    var json = await request.body.asJson();

    var permissionLevel = json['permissionLevel'] as int?;

    var jwt = JWT({
      'username': json['username'],
      'role': json['role'],
      if (permissionLevel != null) 'permissionLevel': permissionLevel
    });

    var token = jwt.sign(_key, expiresIn: Duration(hours: 24));

    return {'token': token};
  }
}
