import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:minerva/minerva.dart';

import 'jwt_auth_middleware_builder.dart';

class MiddlewaresBuilder extends MinervaMiddlewaresBuilder {
  @override
  Future<List<Middleware>> build() async {
    var middlewares = <Middleware>[];

    var configuration = ConfigurationManager();

    await configuration.load();

    var key = SecretKey(configuration['secret']);

    var jwtMiddleware = JwtAuthMiddlewareBuilder(key).build();

    // Adds middleware for handling errors in middleware pipeline
    middlewares.add(ErrorMiddleware());

    middlewares.add(jwtMiddleware);

    // Adds middleware for query mappings to endpoints in middleware pipeline
    middlewares.add(EndpointMiddleware());

    return middlewares;
  }
}
