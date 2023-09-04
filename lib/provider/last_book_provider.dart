import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/book_model.dart';
import '../../data/shared_pref/hive_client.dart';

//Initialize Hive
HiveClient hive = HiveClient();
//



final lastBookProvider = StateNotifierProvider<LastBookProvider, BookModel?>((ref) {

  return LastBookProvider();
});


class LastBookProvider extends StateNotifier<BookModel?>{


  LastBookProvider() : super(null);

  void updateWidget(BookModel bookModel) {

    hive.saveLastBook(bookModel.id);
    state = bookModel;
  }

  void deleteData() {
    hive.deleteLastBook();
    state = null;
  }
}