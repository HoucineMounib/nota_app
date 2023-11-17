import 'package:flutter/material.dart';

class AddNoteButton extends StatelessWidget {
  final void Function()? onAddNote;
  const AddNoteButton({super.key, this.onAddNote});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAddNote,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 32),
          width: MediaQuery.of(context).size.width,
          height: 58,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          ),
          child: Center(
            child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Add Note',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          )),
    );
  }
}
