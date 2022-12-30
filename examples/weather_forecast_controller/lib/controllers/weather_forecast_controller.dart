import 'dart:math';

import 'package:minerva/minerva.dart';
import 'package:minerva_controller_annotation/minerva_controller_annotation.dart';

import '../models/weather_forecast.dart';

part 'weather_forecast_controller.g.dart';

class WeatherForecastController extends ControllerBase {
  final Random _random = Random();

  @Get()
  JsonResult get() {
    const summaries = [
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

    final weatherForecasts = List.generate(
        _random.nextInt(5),
        (index) => WeatherForecast(
            date: DateTime.now().add(Duration(days: index)),
            temperature: _random.nextInt(75) - 20,
            summary: summaries[_random.nextInt(summaries.length)]));

    final json = weatherForecasts.map((e) => e.toJson()).toList();

    return JsonResult(json);
  }
}
