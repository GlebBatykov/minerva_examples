import 'package:flutter/widgets.dart';

import 'note_list/note_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoteList();
  }
}
