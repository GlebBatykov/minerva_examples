import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'test_app_setting.g.dart';

void main() {
  group('Endpoints', () {
    final Dio dio = Dio();

    final String host = $TestAppSetting.host;

    final int port = $TestAppSetting.port;

    test('GET /hello', () async {
      var response = await dio.get('http://$host:$port/weatherForecast');

      expect(jsonDecode(response.data), isList);
    });
  });
}
