import 'package:calculator_service/apis/calculator_api.dart';
import 'package:minerva/minerva.dart';

class ApisBuilder extends MinervaApisBuilder {
  @override
  List<Api> build() {
    return [CalculatorApi()];
  }
}
