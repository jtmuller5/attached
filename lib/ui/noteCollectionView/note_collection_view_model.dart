import 'package:attached/models/love_note.dart';
import 'package:attached/services/services.dart';
import 'package:stacked/stacked.dart';

class NoteCollectionViewModel extends BaseViewModel {
  final String type;
  List<LoveNote> notes = [];
  bool demo = true;

  NoteCollectionViewModel(this.type);

  void initialize(String val) {
    getNotesOfType(type);
  }

  void getNotesOfType(String noteType) {
    notes = noteService.notes.where((note) => note.attachmentType == noteType).toList();

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
