import 'dart:io';

import 'package:test/test.dart';

import 'test_app_setting.g.dart';

void main() {
  group('Endpoints', () {
    final String host = $TestAppSetting.host;

    final int port = $TestAppSetting.port;

    int counter = 0;

    late WebSocket socket;

    setUp(() async {
      socket = await WebSocket.connect('ws://$host:$port/counter');
    });

    test('\'get\' command', () async {
      socket.add('get');

      expect(int.parse(await socket.first), counter);
    });

    test('\'increment\' command', () async {
      counter++;

      socket.add('increment');

      expect(int.parse(await socket.first), counter);
    });

    test('\'decrement\' command', () async {
      counter--;

      if (counter < 0) {
        counter = 0;
      }

      socket.add('decrement');

      expect(int.parse(await socket.first), counter);
    });
  });
}
