import 'dart:isolate';

import 'package:minerva/minerva.dart';

class CounterAgent extends Agent {
  final List<SendPort> _subscribers = [];

  int _counter = 0;

  @override
  dynamic call(String action, Map<String, dynamic> data) {
    switch (action) {
      case 'get':
        return _counter;
    }

    return null;
  }

  @override
  void cast(String action, Map<String, dynamic> data) {
    switch (action) {
      case 'subscribe':
        _subscribers.add(data['port']);
        break;
      case 'increment':
        _counter++;
        _notifySubscribers();
        break;
      case 'decrement':
        _counter--;

        if (_counter >= 0) {
          _notifySubscribers();
        } else {
          _counter = 0;
        }
    }
  }

  void _notifySubscribers() {
    for (var port in _subscribers) {
      port.send(_counter);
    }
  }
}
