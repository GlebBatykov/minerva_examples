import 'package:minerva/minerva.dart';

class EndpointsBuilder extends MinervaEndpointsBuilder {
  @override
  void build(Endpoints endpoints) {
    // Create route for GET requests with path '/hello'
    endpoints.get('/hello', (context, request) {
      var message = context.store['message'];

      return message;
    });
  }
}
