import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/styles/box_decoration.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../dialoq/note_dialog/add_note_dialog.dart';
import '../dialoq/translate_dialog/translate_dialog.dart';

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
        padding: const CustomPadding(ver: 8, hor: 15),
        decoration: CustomDecoration(
          radius: radius,
          backgroundColor: colorAccent.withOpacity(0.05)
        ),

        child: Row(
          children: [
            _iconButton(
                icon: Icons.translate,
                onTap: () {
                  TranslateDialog(context, ref, selectedText);
                  controller.clearSelection();
                }
            ),

            _iconButton(
                icon: Icons.note_add,
                onTap: () {
                  AddNoteDialog(context, ref);
                  controller.clearSelection();
                }
            ),
            _iconButton(
                icon: Icons.copy,
                onTap: (){
                  Clipboard.setData(ClipboardData(text: selectedText));
                  controller.clearSelection();
                }
            ),

          ],
        ),
      ),
    );
  }


  static _iconButton ({required IconData? icon, required Function() onTap}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),

      child: IconButton(
        onPressed: onTap,

        icon: Icon(icon, size: 19),
        color: colorAccent,
      ),
    );

  }
}
