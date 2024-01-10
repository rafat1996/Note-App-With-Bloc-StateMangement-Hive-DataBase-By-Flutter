import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/notes-cubit/notes_cubit.dart';
import 'package:noteapp/models/note-model.dart';
import 'package:noteapp/views/edit-note-view.dart';

class NoteItemWidget extends StatelessWidget {
  const NoteItemWidget({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return  EditNoteView(noteModel:  note,);
        })));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                note.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              subtitle: Text(
                note.content,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8), fontSize: 16),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 35,
                  )),
            ),
            Text(
              note.date,
              style:
                  TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
