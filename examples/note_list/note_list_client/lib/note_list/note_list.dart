import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'note.dart';
import 'note_list_item.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final List<Note> _notes = [];

  @override
  void initState() {
    super.initState();

    _loadNotes();
  }

  Future<void> _loadNotes() async {
    var dio = Dio();

    var response = await dio.get('http://localhost:5000/notes');

    var notes = response.data['notes']
        .map((e) => Note.fromJson(e))
        .toList()
        .cast<Note>();

    setState(() {
      _notes.clear();

      _notes.addAll(notes);
    });
  }

  Future<void> _addNote() async {
    var dio = Dio();

    var number = Random().nextInt(10000);

    var data = {
      'title': 'Title of note $number',
      'value': 'Value of note $number'
    };

    await dio.post('http://localhost:5000/notes/add', data: data);
  }

  Future<void> _removeNote(String id) async {
    var dio = Dio();

    var data = {'id': id};

    await dio.delete('http://localhost:5000/notes', data: data);
  }

  Widget _buildBody() {
    if (_notes.isNotEmpty) {
      return SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          ..._notes
              .map((e) => NoteListItem(
                    title: e.title,
                    value: e.value,
                    cancelOnPressed: _buildCancelButtonOnPressed(e),
                  ))
              .toList()
        ],
      ));
    } else {
      return const Center(
          child: Text('List is empty', style: TextStyle(fontSize: 20)));
    }
  }

  void Function() _buildCancelButtonOnPressed(Note note) => () async {
        var id = note.id;

        await _removeNote(id);

        setState(() {
          _notes.removeWhere((element) => element.id == id);
        });
      };

  void _addButtonOnPressed() async {
    await _addNote();

    await _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: _buildBody()),
        Positioned(
            bottom: 15,
            right: 15,
            child: FloatingActionButton(
                onPressed: _addButtonOnPressed, child: const Icon(Icons.add)))
      ],
    );
  }
}
