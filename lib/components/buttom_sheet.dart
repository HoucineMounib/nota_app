import 'package:flutter/material.dart';
import 'package:nota_app/components/addNote_button.dart';
import 'package:nota_app/components/build_feild.dart';
import 'package:nota_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota_app/models/note_model.dart';
import 'package:nota_app/validator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtomSheet extends StatelessWidget {
  CustomButtomSheet(
      {super.key,
      required this.noteFormKey,
      required this.titleController,
      required this.subtitleController});

  final GlobalKey<FormState> noteFormKey;
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  String? titel, subtitle;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('Feaild Adding Data${state.errorMessage}');
          }

          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                  key: noteFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 64),
                        child: Center(
                          child: Text(
                            'Add Note Details',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark),
                          ),
                        ),
                      ),
                      MyFeild(
                        controller: titleController,
                        title: 'Note Title',
                        validation: NoteValidator.isTitleValid,
                        titlecolor: Theme.of(context).primaryColor,
                        focus: true,
                        onSaved: (value) {
                          titel = value;
                        },
                      ),
                      MyFeild(
                        controller: subtitleController,
                        title: 'Note Description',
                        validation: NoteValidator.isTitleValid,
                        titlecolor: Theme.of(context).primaryColor,
                        focus: true,
                        onSaved: (value) {
                          subtitle = value;
                        },
                      ),
                      AddNoteButton(
                        onAddNote: () {
                          if (noteFormKey.currentState!.validate()) {
                            noteFormKey.currentState!.save();

                            NoteModel note = NoteModel(
                                title: titel!,
                                description: subtitle!,
                                date: DateTime.now().toString(),
                                color: Colors.blue.value);

                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(note);
                          }
                        },
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
