import 'package:flutter/material.dart';

import 'body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note list example'),
      ),
      body: const Body(),
    );
  }
}
