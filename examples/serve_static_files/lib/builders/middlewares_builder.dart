import 'package:minerva/minerva.dart';

class MiddlewaresBuilder extends MinervaMiddlewaresBuilder {
  @override
  List<Middleware> build() {
    var middlewares = <Middleware>[];

    // Adds middleware for handling errors in middleware pipeline
    middlewares.add(ErrorMiddleware());

    middlewares.add(StaticFilesMiddleware(
        directory: '/wwwroot', path: '/files', root: 'index.txt'));

    // Adds middleware for query mappings to endpoints in middleware pipeline
    middlewares.add(EndpointMiddleware());

    return middlewares;
  }
}
