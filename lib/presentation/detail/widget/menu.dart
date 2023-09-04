import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/controllers/book_controller.dart';
import '../../../provider/book_list_provider.dart';
import '../../views/dialoq/edit_last_page_dialog/edit_last_page_dialoq.dart';
import '../../views/menu/menu_widget.dart';
import '../../views/text_inria_sans.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _) {

          return MenuWidget(
              menuItems: [
                PopupMenuItem<int>(
                  value: 0,
                  child: TextInriaSans("Edit Last Page", color: colorAccent,),
                ),

                PopupMenuItem<int>(
                  value: 1,
                  child: TextInriaSans("Mark As Complete", color: colorAccent,),
                ),
              ],

              functions: (value) {
                if(value == 0){
                  //open Dialog showing list of bookmarks
                  EditLastPageDialog(context, ref);
                }

                if (value == 1) {
                  ref.read(bookListProvider.notifier).toggleAsCompleted(bookModel);
                }
              }
          );
        }
    );
  }
}
