import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import '../../../data/model/book_model.dart';
import 'book_list_item.dart';

class BookListView extends ConsumerWidget {
  const BookListView({Key? key, required this.files}) : super(key: key);

  final List files;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //sort by add date
    files.sort((a, b) {
      return b.addDate.compareTo(a.addDate);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        itemCount: files.length,
        //using sliver so I don't have to call NeverScrollableScrollPhysics()
        // for better performance.
        // NeverScrollableScrollPhysics() for small lists as it lay off the whole list at once
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3.2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 15),

        itemBuilder: (BuildContext context, int index) {
          String name = basename(files[index].id); //removes .pdf
          return BookListItem(
            index,
            ref,
            bookName: name,
            bookModel: BookModel(
              id: files[index].id,
              path: files[index].path,
              bookmarks: files[index].bookmarks,
              lastPage: files[index].lastPage,
              totalPages: files[index].totalPages,
              category: files[index].category,
              addDate: files[index].addDate,
              completeDate: files[index].completeDate,
              isComplete: files[index].isComplete,
            ),
          );
        },
      ),
    );
  }
}
