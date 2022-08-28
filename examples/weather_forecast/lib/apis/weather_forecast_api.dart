import 'dart:math';

import 'package:minerva/minerva.dart';

import '../models/weather_forecast.dart';

class WeatherForecastApi extends Api {
  final Random _random = Random();

  final List<String> _summaries = [
    'Freezing',
    'Bracing',
    'Chilly',
    'Cool',
    'Mild',
    'Warm',
    'Balmy',
    'Hot',
    'Sweltering',
    'Scorching'
  ];

  @override
  void build(Endpoints endpoints) {
    endpoints.get('/weatherForecast', _getEndpoint);
  }

  dynamic _getEndpoint(ServerContext context, MinervaRequest request) {
    return List.generate(
        _random.nextInt(5),
        (index) => WeatherForecast(
            date: DateTime.now().add(Duration(days: index)),
            temperature: _random.nextInt(75) - 20,
            summary: _summaries[_random.nextInt(_summaries.length)]));
  }
}
