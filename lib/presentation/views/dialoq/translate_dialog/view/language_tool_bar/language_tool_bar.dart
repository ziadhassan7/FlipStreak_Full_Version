import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/views/dialoq/translate_dialog/view/language_tool_bar/language_picker/language_source_button.dart';
import 'package:flutter/material.dart';
import 'language_picker/language_to_button.dart';

class LanguageToolbar extends StatelessWidget {
  const LanguageToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const LanguageSourceButton(),

        convertButton(),

        const LanguageToButton(),
      ],
    );
  }

  Widget convertButton(){
    return IconButton(
      onPressed: () {

      },
      icon: const Icon(Icons.compare_arrows_rounded),
      color: colorAccent,
    );
  }
}
