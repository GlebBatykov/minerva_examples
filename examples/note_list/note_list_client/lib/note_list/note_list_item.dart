import 'package:flutter/material.dart';

class NoteListItem extends StatelessWidget {
  final String title;

  final String value;

  final void Function() cancelOnPressed;

  const NoteListItem(
      {Key? key,
      required this.title,
      required this.value,
      required this.cancelOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.6,
      height: size.height * 0.125,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2.5),
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10)
          ]),
      child: Stack(
        children: [
          Positioned.fill(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Text(value)
              ])),
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: cancelOnPressed,
                  icon: const Icon(
                    Icons.cancel,
                    size: 20,
                  )))
        ],
      ),
    );
  }
}
