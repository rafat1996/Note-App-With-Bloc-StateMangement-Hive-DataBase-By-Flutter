import 'package:flutter/material.dart';
import 'package:noteapp/widget/bottom-sheet-widget.dart';
import 'package:noteapp/widget/notes-view-body-widget.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const BottomSheetWidget();
              });
        },
        backgroundColor: const Color.fromARGB(255, 151, 182, 141),
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBodyWidget(),
    );
  }
}
