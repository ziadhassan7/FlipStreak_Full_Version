import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/styles/box_decoration.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../dialoq/note_dialog/add_note_dialog.dart';
import '../dialoq/translate_dialog/translate_dialog.dart';


enum MenuItem {
  Copy,
  Note,
  Translate
}

class ContextMenuView extends ConsumerWidget {
  const ContextMenuView({Key? key, required this.selectedText,}) : super(key: key);

  final String selectedText;
  final double radius = 15;
  final double elevation = 15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius),),
      elevation: elevation,
      color: Colors.white,

      child: Container(
        width: 260, height: 50,
        padding: const CustomPadding(ver: 8, hor: 15),
        decoration: CustomDecoration(
          radius: radius,
          backgroundColor: colorAccent.withOpacity(0.05)
        ),

        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
            itemCount: MenuItem.values.length,

            itemBuilder: (context, index) {
              return _menuItem(
                  context, ref,
                  MenuItem.values[index],
                  selectedText);
              },
        )
      ),
    );
  }



  static _menuItem (
      BuildContext context,
      WidgetRef ref,
      MenuItem currentItem,
      String selectedText) {

    return Center(
      child: Padding(
        padding: const CustomPadding(hor: 15),

        child: InkWell(
            onTap: (){
              switch (currentItem){
                case MenuItem.Copy:
                  Clipboard.setData(ClipboardData(text: selectedText));
                  controller.clearSelection();
                  break;

                case MenuItem.Note:
                  AddNoteDialog(context, ref);
                  controller.clearSelection();
                  break;

                case MenuItem.Translate:
                  TranslateDialog(context, ref, selectedText);
                  controller.clearSelection();
                  break;
              }
            },

            child: TextInriaSans(currentItem.name, color: colorAccent, size: 16,)),
      ),
    );

  }
}