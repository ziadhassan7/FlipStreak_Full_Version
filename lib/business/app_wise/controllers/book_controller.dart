import 'package:flip_streak/business/string_list_converter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../data/local_db/book_client.dart';
import '../../../data/model/book_model.dart';

final PdfViewerController controller = PdfViewerController();
BookClient bookClient = BookClient.instance;

// Initial Book model    // static instance - sensitive to global changes
BookModel bookModel = BookModel(
    id: "id", path: "path", bookmarks: null,
    lastPage: 0, totalPages: 0,
    category: null,
    addDate: "0", completeDate: "0",
    isComplete: 0,
);


///Globalize BookModel
//Get Current Book model, and
// make it accessible throughout the whole application
Future<void> globalizeCurrentBookModel(String currentBookId) async {
  BookModel currentBook = await bookClient.readOneElement(currentBookId);
  bookModel = currentBook;
}


/// Update Values
// update all values
void updateBookDetails () {
  bookClient.updateItem(bookModel);
}



/// Bookmark
// get bookmark
Future<List<String>> getBookmarkedPages (String id) async {
  BookModel book = await bookClient.readOneElement(id);

  return getListFromString(book.bookmarks ?? "");
}


/// Last Page
// get last Page
Future<int> getLastPage (String id) async {
  BookModel book = await bookClient.readOneElement(id);
  return book.lastPage;
}

// jump to last page
Future<void> jumpToLastPage (String id) async {

  getLastPage(id).then((value) {
    controller.jumpToPage(value);
  });
}


/// Total Pages
// get total pages
Future<int> getTotalPages (String id) async {
  BookModel book = await bookClient.readOneElement(id);
  return book.totalPages;
}

/// Book Category
// get Book Category or label
Future<List<String>> getCategoryList (String id) async {
  BookModel book = await bookClient.readOneElement(id);

  return getListFromString(book.category ?? "");
}

/// Book Completion state
// get is book complete?
Future<int> getCompletionState (String id) async {
  BookModel book = await bookClient.readOneElement(id);
  return book.isComplete;
}

//mark book as completed
markAsComplete () {

  bookModel = bookModel.copyWith(
    completeDate: DateTime.now().toString(), //<-- update completion date
    isComplete: 1, //<-- update completion state
  );

  updateBookDetails();
}

//mark book as incomplete
markAsIncomplete () {

  bookModel = bookModel.copyWith(
    completeDate: null, //<-- update completion date
    isComplete: 0, //<-- update completion state
  );

  updateBookDetails();
}


