import 'package:flip_streak/presentation/views/dialoq/translate_dialog/view/translate_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../provider/translation_provider.dart';
import '../dialoq_widget.dart';


class TranslateDialog {

  static final TextEditingController textController = TextEditingController();

  TranslateDialog(BuildContext context, WidgetRef ref, String? selectedText){

    ref.read(translationProvider.notifier).translate(selectedText);

    DialogWidget(
        context,

        dominantButtonTitle: 'Translate',
        dominateButtonCloseAfterFunction: false,
        dominantButtonFunction: (){
          ref.read(translationProvider.notifier).translate(textController.text);
        },

        child: TranslateView(selectedText)

    ).showAlert();
  }

}