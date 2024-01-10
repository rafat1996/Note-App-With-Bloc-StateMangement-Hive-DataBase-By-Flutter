import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/models/note-model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());
  Color? color;
  addNote(NoteModel noteModel) async {
    noteModel.color = color!.value;
    emit(AddNoteCubitLoading());
    try {
      var noteBox = Hive.box<NoteModel>('note_box');

      await noteBox.add(noteModel);

      emit(AddNoteCubitSuccess());
    } on Exception catch (e) {
      emit(AddNoteCubitFailure(e.toString()));
    }
  }
}
