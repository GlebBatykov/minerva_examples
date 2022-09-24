import 'package:minerva/minerva.dart';

class CalculatorApi extends Api {
  @override
  void build(Endpoints endpoints) {
    const filter = RequestFilter(
        body: JsonFilter(fields: [
      JsonField(name: 'first', type: JsonFieldType.num),
      JsonField(name: 'second', type: JsonFieldType.num)
    ]));

    endpoints.post('/add', _add, filter: filter);

    endpoints.post('/minus', _minus, filter: filter);

    endpoints.post('/divide', _divide, filter: filter);

    endpoints.post('/multiply', _multiply, filter: filter);
  }

  dynamic _add(ServerContext context, MinervaRequest request) async {
    final json = await request.body.asJson();

    var result = json['first'] + json['second'];

    return {'result': result};
  }

  dynamic _minus(ServerContext context, MinervaRequest request) async {
    final json = await request.body.asJson();

    var result = json['first'] - json['second'];

    return {'result': result};
  }

  dynamic _divide(ServerContext context, MinervaRequest request) async {
    final json = await request.body.asJson();

    var result = json['first'] / json['second'];

    return {'result': result};
  }

  dynamic _multiply(ServerContext context, MinervaRequest request) async {
    final json = await request.body.asJson();

    var result = json['first'] * json['second'];

    return {'result': result};
  }
}
