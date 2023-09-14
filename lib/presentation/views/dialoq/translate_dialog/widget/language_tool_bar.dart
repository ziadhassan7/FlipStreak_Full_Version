import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flutter/material.dart';
import 'language_picker.dart';

class LanguageToolbar extends StatefulWidget {
  const LanguageToolbar({Key? key}) : super(key: key);

  @override
  State<LanguageToolbar> createState() => _LanguageToolbarState();
}

class _LanguageToolbarState extends State<LanguageToolbar> {

  final HiveClient _hiveClient = HiveClient();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Source Language
        LanguagePicker(
          currentLanguage: getSourceLanguage(),
          isSourceLanguage: true,
        ),

        // Converter
        convertButton(),

        // To Language
        LanguagePicker(
          currentLanguage: getToLanguage(),
          isSourceLanguage: false,
        ),
      ],
    );
  }

  Widget convertButton(){
    return IconButton(
      onPressed:() {
        setState(() {
          swapLanguages();
        });
      },
      icon: const Icon(Icons.compare_arrows_rounded),
      color: colorAccent,
    );
  }

  String getSourceLanguage(){
    return _hiveClient.getLanguageSource();
  }

  String getToLanguage(){
    return _hiveClient.getLanguageTo();
  }

  swapLanguages(){
    String source= getSourceLanguage();
    String to= getToLanguage();

    if(source != "Auto Detect"){
      _hiveClient.updateLanguageSource(to);
      _hiveClient.updateLanguageTo(source);
    }
  }
}
