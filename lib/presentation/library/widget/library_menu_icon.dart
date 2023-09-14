import 'package:flip_streak/data/model/book_model.dart';
import 'package:flip_streak/presentation/views/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../provider/book_list_provider.dart';
import '../../views/dialoq/category_attacher/category_attacher_dialog.dart';
import '../../views/dialoq/delete_dialog/delete_book_dialoq.dart';
import '../../views/text_inria_sans.dart';

class LibraryMenuIcon extends ConsumerWidget {
  const LibraryMenuIcon({Key? key, required this.currentBook}) : super(key: key);

  final BookModel currentBook;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuWidget(
      //iconColor: Colors.black,

      menuItems: [
        PopupMenuItem<int>(
          value: 0,
          child: TextInriaSans("Add label", color: colorAccent,),
        ),

        PopupMenuItem<int>(
          value: 1,
          child: TextInriaSans("Mark As Complete", color: colorAccent,),
        ),

        PopupMenuItem<int>(
          value: 2,
          child: TextInriaSans("Delete book", color: colorAccent,),
        ),
      ],

      functions: (value) {
        if(value == 0){
          CategoryAttacherDialog(context, ref, currentBook: currentBook);
        }

        if (value == 1) {
          ref.read(bookListProvider.notifier).toggleAsCompleted(currentBook);
        }

        if (value == 2) {
          DeleteBookDialog(context, ref, bookId: currentBook.id,);
        }
      }
    );
  }
}
