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
        const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54,),

        // To Language
        LanguagePicker(
          currentLanguage: getToLanguage(),
          isSourceLanguage: false,
        ),
      ],
    );
  }

  String getSourceLanguage(){
    return _hiveClient.getLanguageSource();
  }

  String getToLanguage(){
    return _hiveClient.getLanguageTo();
  }
}
