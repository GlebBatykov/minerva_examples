import 'dart:convert';

class WeatherForecast {
  final DateTime date;

  final int temperature;

  final String summary;

  WeatherForecast(
      {required this.date, required this.temperature, required this.summary});

  @override
  String toString() {
    return jsonEncode({
      'date': date.toString(),
      'temperature': temperature,
      'summary': summary
    });
  }
}
