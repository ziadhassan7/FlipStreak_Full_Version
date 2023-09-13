import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/local_db/note_client.dart';
import '../../data/model/note_model.dart';

final noteListProvider = StateNotifierProvider<NoteProvider, List<NoteModel>>((ref) {

  return NoteProvider();
});


class NoteProvider extends StateNotifier<List<NoteModel>> {
  NoteClient noteClient = NoteClient.instance;

  NoteProvider() : super([]) {
    listFiles();
  }


  /// State Function
  updateNotifier() async {
    state = await noteClient.readAllElements();
  }

  /// ---------------------------------------------------------------


  /// Returns All Items
  void listFiles() async {
    //Get List of all notes
    await updateNotifier();
  }

  /// Add New Note
  addNote(NoteModel newModel) async {

    //Create new Note Item
    noteClient.createItem(newModel);

    //Get List of all books
    await updateNotifier();
  }

  /// Add New Note
  void deleteNote(String noteId) async {

    //Create new Note Item
    noteClient.deleteItem(noteId);

    //Get List of all books
    await updateNotifier();
  }
}