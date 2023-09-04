import 'package:flip_streak/business/controllers/book_controller.dart';
import 'package:flip_streak/data/local_db/book_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../provider/bookmark_list_provider.dart';
import '../../text_inria_sans.dart';
import 'bookmark_list_item.dart';

class BookmarkList extends ConsumerWidget {
  BookmarkList({Key? key}) : super(key: key);

  final BookClient bookClient = BookClient.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //Get Bookmarks
    final List<String> bookmarks = ref.watch(bookmarkListProvider);

    return Padding(
      padding: const EdgeInsets.all(10),

      child:
        (bookmarks.isNotEmpty)
        ? Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookmarks.length,
                itemBuilder: (context, index){

                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    width: 170,
                    child: BookmarkListItem(navigateFromInsideBook: false, currentPage: bookmarks[index]));
                })
          )

          : Center(child: TextInriaSans("Nothing here"),),

    );
  }

  Future<List> getData() async {
    List bookmarks = await getBookmarkedPages(bookModel.id);
    return bookmarks;
  }
}
