import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/notes-cubit/notes_cubit.dart';
import 'package:noteapp/models/note-model.dart';
import 'package:noteapp/widget/custom-appbar-widget.dart';
import 'package:noteapp/widget/custom-text-field-widget.dart';

class EditNoteBodyWidget extends StatefulWidget {
  const EditNoteBodyWidget({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteBodyWidget> createState() => _EditNoteBodyWidgetState();
}

class _EditNoteBodyWidgetState extends State<EditNoteBodyWidget> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomAppBarWidget(
              onPressed: () {
                widget.noteModel.title = title ?? widget.noteModel.title;
                widget.noteModel.content = content ?? widget.noteModel.content;
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: const Icon(Icons.check),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(
              hint: widget.noteModel.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(
              hint: widget.noteModel.content,
              maxLine: 5,
              onChanged: (value) {
                content = value;
              },
            )
          ],
        ),
      ),
    );
  }
}
