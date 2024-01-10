import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/add-note-cubit/add_note_cubit_cubit.dart';
import 'package:noteapp/cubit/notes-cubit/notes_cubit.dart';
import 'package:noteapp/widget/add-note-widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubitCubit(),
      child: BlocConsumer<AddNoteCubitCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteCubitSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }

          if (state is AddNoteCubitFailure) {
            print(state.errorMessage.toString());
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteCubitLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(child: AddNoteWidget()),
              ));
        },
      ),
    );
  }
}
