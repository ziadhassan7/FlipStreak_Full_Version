import '../../data/local_db/book_client.dart';
import '../../data/model/book_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final completedProvider = StateNotifierProvider<CompletedProvider, List<BookModel>>((ref) {

  return CompletedProvider();
});


class CompletedProvider extends StateNotifier<List<BookModel>>{
  BookClient bookClient = BookClient.instance;


  CompletedProvider() : super([]){
    getCompletedBooks();
  }


  Future<List<BookModel>> getCompletedBooks() async {

    List<BookModel> allBooks = await bookClient.readAllElements();
    List<BookModel> completed = [];

    //Iterate through all books, and save the favourites
    for (var element in allBooks) {
      if (element.isComplete == 1) {
        completed.add(element);
      }
    }

    state = completed;

    return completed;
  }


  void toggleCompleted(BookModel book, int initialValue) async {

    BookModel newModel;

    initialValue == 0
        ? newModel = book.copyWith(isComplete: 1) //if false, make it true (1)
        : newModel = book.copyWith(isComplete: 0); //else , make it false (0)

    bookClient.updateItem(newModel); //Update item in database

    //Get List of all books, and return only favourites
    state = await getCompletedBooks();
  }
}