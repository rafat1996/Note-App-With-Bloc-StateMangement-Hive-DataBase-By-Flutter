import 'package:flutter/material.dart';
import 'package:noteapp/models/note-model.dart';
import 'package:noteapp/widget/edit-note-body-widget.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});
final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteBodyWidget(noteModel: noteModel,),
    );
  }
}
