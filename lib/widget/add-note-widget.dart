import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/add-note-cubit/add_note_cubit_cubit.dart';
import 'package:noteapp/models/note-model.dart';
import 'package:noteapp/widget/color-listview-widget.dart';
import 'package:noteapp/widget/custom-button-widget.dart';
import 'package:noteapp/widget/custom-text-field-widget.dart';
import 'package:intl/intl.dart';

class AddNoteWidget extends StatefulWidget {
  const AddNoteWidget({
    super.key,
  });

  @override
  State<AddNoteWidget> createState() => _AddNoteWidgetState();
}

class _AddNoteWidgetState extends State<AddNoteWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content, date;
  int? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(
              hint: 'Title',
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(
              hint: 'Content',
              onSaved: (value) {
                content = value;
              },
              maxLine: 5,
            ),
                const SizedBox(
              height: 10,
            ),
            const ColorListView(),
            BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
              builder: (context, state) {
                return CustomButtonWidget(
                  isLoading: state is AddNoteCubitLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var date = DateTime.now();
                      var dateFormat = DateFormat.yMMMEd().format(date);
                      var noteModel = NoteModel(
                          title: title!,
                          content: content!,
                          date: dateFormat,
                          color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubitCubit>(context)
                          .addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
