import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/notes-cubit/notes_cubit.dart';
import 'package:noteapp/widget/custom-appbar-widget.dart';
import 'package:noteapp/widget/notes-list-widget.dart';

class NotesViewBodyWidget extends StatefulWidget {
  const NotesViewBodyWidget({super.key});

  @override
  State<NotesViewBodyWidget> createState() => _NotesViewBodyWidgetState();
}

class _NotesViewBodyWidgetState extends State<NotesViewBodyWidget> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CustomAppBarWidget(
              title: 'Notes App',
              icon: Icon(Icons.search),
            ),
            Expanded(child: NoteListWidget())
          ],
        ),
      ),
    );
  }
}
