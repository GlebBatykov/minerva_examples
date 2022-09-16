import 'package:minerva/minerva.dart';

class RedirectionMiddlewareBuilder {
  Future<RedirectionMiddleware> build() async {
    var configuration = ConfigurationManager();

    await configuration.load();

    var address = configuration['calculate_service_address'];

    return RedirectionMiddleware(redirections: [
      RedirectionData(
          method: HttpMethod.post, path: '/add', location: '$address/add'),
      RedirectionData(
          method: HttpMethod.post,
          path: '/minus',
          location: '$address/minus',
          authOptions: AuthOptions(jwt: JwtAuthOptions(roles: ['User']))),
      RedirectionData(
          method: HttpMethod.post,
          path: '/divide',
          location: '$address/divide',
          authOptions: AuthOptions(jwt: JwtAuthOptions(roles: ['Admin']))),
      RedirectionData(
          method: HttpMethod.post,
          path: '/multiply',
          location: '$address/multiply',
          authOptions: AuthOptions(jwt: JwtAuthOptions(permissionLevel: 2)))
    ]);
  }
}
