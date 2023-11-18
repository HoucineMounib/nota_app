import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  ReadNoteCubit() : super(ReadNoteInitial());
}
