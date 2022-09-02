import 'dart:io';
import 'dart:isolate';

import 'package:minerva/minerva.dart';

class WebSocketApi extends Api {
  final List<WebSocket> _sockets = [];

  late final ReceivePort _receivePort;

  late final AgentConnector _connector;

  @override
  void initialize(ServerContext context) {
    _receivePort = ReceivePort();

    _receivePort.listen(_handleMessage);

    _connector = context.connectors['counter']!;

    _connector.cast('subscribe', data: {'port': _receivePort.sendPort});
  }

  void _handleMessage(dynamic message) {
    if (message is int) {
      for (var socket in _sockets) {
        socket.add(message.toString());
      }
    }
  }

  @override
  void build(Endpoints endpoints) {
    endpoints.ws('/counter', _counter);
  }

  void _counter(ServerContext context, WebSocket socket) {
    socket.listen((event) async {
      switch (event) {
        case 'get':
          var state = await _connector.call('get');

          socket.add(state.toString());
          break;
        case 'increment':
          _connector.cast('increment');
          break;
        case 'decrement':
          _connector.cast('decrement');
      }
    });

    socket.done.then((value) => _sockets.remove(socket));

    _sockets.add(socket);
  }

  @override
  void dispose(ServerContext context) {
    _receivePort.close();
  }
}
