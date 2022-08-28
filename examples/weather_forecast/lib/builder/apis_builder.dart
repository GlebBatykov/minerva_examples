import 'package:minerva/minerva.dart';

import '../apis/weather_forecast_api.dart';

class ApisBuilder extends MinervaApisBuilder {
  @override
  List<Api> build() {
    return [WeatherForecastApi()];
  }
}
