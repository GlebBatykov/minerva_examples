import 'package:minerva/minerva.dart';

import '../controllers/weather_forecast_controller.dart';

class ApisBuilder extends MinervaApisBuilder {
  @override
  List<Api> build() {
    return [WeatherForecastApi()];
  }
}
