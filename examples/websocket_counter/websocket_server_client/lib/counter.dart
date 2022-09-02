import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int? _counter;

  late final IOWebSocketChannel _channel;

  @override
  void initState() {
    super.initState();

    _channel = IOWebSocketChannel.connect('ws://localhost:5000/counter');

    _channel.stream.listen(_handleEvent);

    _channel.sink.add('get');
  }

  void _handleEvent(dynamic event) {
    var counter = int.tryParse(event);

    if (counter != null) {
      setState(() {
        _counter = counter;
      });
    }
  }

  void _increment() {
    _channel.sink.add('increment');
  }

  void _decrement() {
    _channel.sink.add('decrement');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Center(
          child: Text('Counter state: ${_counter ?? '?'}',
              style: const TextStyle(fontSize: 24)),
        )),
        Positioned(
            right: 15,
            bottom: 15,
            child: FloatingActionButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
            )),
        Positioned(
            right: 15,
            bottom: 80,
            child: FloatingActionButton(
              onPressed: _decrement,
              child: const Icon(Icons.remove),
            ))
      ],
    );
  }

  @override
  void dispose() async {
    await _channel.sink.close();

    super.dispose();
  }
}
