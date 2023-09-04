import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/controllers/page_controller.dart';
import '../dialoq/note_dialog/add_note_dialog.dart';
import '../dialoq/translate_dialog/translate_dialog.dart';

class SelectionBar extends ConsumerWidget {
  const SelectionBar({Key? key, required this.foregroundColor, required this.backgroundColor,}) : super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,


      child: Row(
        children: [

          iconButton(
            icon: Icons.close,
            onTap: ()=> Navigator.pop(context)
          ),


          const Spacer(),

          iconButton(
              icon: Icons.translate,
              onTap: () => TranslateDialog(context, ref, globalSelectedText),
          ),

          iconButton(
              icon: Icons.note_add,
              onTap: ()=> AddNoteDialog(context, ref)
          ),
          iconButton(
              icon: Icons.copy,
              onTap: (){
                Clipboard.setData(ClipboardData(text: globalSelectedText??""));
                Navigator.pop(context);
              }
          ),



        ],
      ),
    );
  }


  Widget iconButton ({required IconData? icon, required Function() onTap}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),

      child: IconButton(
        onPressed: onTap,

        icon: Icon(icon, size: 19),
        color: foregroundColor,),
    );

  }
}
