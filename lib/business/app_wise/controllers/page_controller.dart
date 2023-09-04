import 'package:flip_streak/data/local_db/book_client.dart';
import 'package:flip_streak/data/model/book_model.dart';
import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/views/topbar/search_bar.dart';
import '../../../provider/bookmark_list_provider.dart';
import 'book_controller.dart';

//Selected Text
String? globalSelectedText;
HiveClient hiveClient = HiveClient();

/// Check Fab on page change
void checkFab(WidgetRef ref,) {

  // update FAB bookmark button
  ref.read(bookmarkListProvider.notifier)
      .toggleBookmarkButton();

  hiveClient.updateLastPage(controller.pageNumber);

}

/// Update Last page
updateLastPage({required int pageNumber}) {

  // update Book Model
  bookModel = bookModel.copyWith(lastPage: pageNumber,);

  // update last page, only if page didn't flip while search
  if (!FindBar.searchResult.hasResult) {
    updateBookDetails();
  }
}

/// Update Last page - from hive - updates on last widget
refreshLastPageFromHiveAndGetBook(BookModel model) async {
  BookClient bookClient = BookClient.instance;
  int savedPageNumber = await hiveClient.getLastPage();

  if(savedPageNumber != 0) {
    model = model.copyWith(lastPage: savedPageNumber);
    await bookClient.updateItem(model); //update item
  }

  return model;
}

