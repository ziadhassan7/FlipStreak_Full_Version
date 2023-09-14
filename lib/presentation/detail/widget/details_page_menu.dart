import 'package:flip_streak/presentation/views/dialoq/note_dialog/add_note_dialog.dart';
import 'package:flip_streak/provider/last_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../provider/book_list_provider.dart';
import '../../views/dialoq/edit_last_page_dialog/edit_last_page_dialoq.dart';
import '../../views/menu/menu_widget.dart';
import '../../views/text_inria_sans.dart';

class DetailsPageMenu extends StatelessWidget {
  DetailsPageMenu({Key? key}) : super(key: key);

  Function(Function())? updateState;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {

          return MenuWidget(
              menuItems: [
                PopupMenuItem<int>(
                  value: 0,
                  child: TextInriaSans("Add note", color: colorAccent,),
                ),

                PopupMenuItem<int>(
                  value: 1,
                  child: TextInriaSans("Edit Last Page", color: colorAccent,),
                ),

                PopupMenuItem<int>(
                  value: 2,
                  child: StatefulBuilder(
                    builder: (context, Function(Function()) setState) {
                      updateState = setState;
                      return TextInriaSans(getCompleteButtonText(), color: colorAccent,);
                    }
                  ),
                ),
              ],

              functions: (value) {
                if(value == 0){
                  //open Dialog to add note
                  AddNoteDialog(context, ref,);
                }

                if(value == 1){
                  //open Dialog showing list of bookmarks
                  EditLastPageDialog(context, ref);
                }

                if (value == 2) {
                  ref.read(bookListProvider.notifier).toggleAsCompleted(bookModel);

                  // Also change it in the last book widget
                  if(bookModel.isComplete == 1){
                    ref.read(lastBookProvider.notifier).updateLastPage(bookModel, bookModel.totalPages);
                  } else {
                    ref.read(lastBookProvider.notifier).updateLastPage(bookModel, 0);
                  }

                  updateState!((){});
                }
              }
          );
        }
    );
  }

  String getCompleteButtonText() {
    int isCompleted = bookModel.isComplete;

    if(isCompleted == 1){
      return "Mark As Not Complete";

    } else {
      return "Mark As Completed";
    }
  }
}
