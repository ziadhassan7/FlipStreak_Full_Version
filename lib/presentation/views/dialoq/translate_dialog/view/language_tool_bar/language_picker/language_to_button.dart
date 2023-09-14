import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flutter/material.dart';
import 'language_picker.dart';

class LanguageToButton extends StatelessWidget {
  const LanguageToButton({Key? key}) : super(key: key);

  static final HiveClient _hiveClient = HiveClient();

  @override
  Widget build(BuildContext context) {
    return LanguagePicker(
      currentLanguage: _hiveClient.getLanguageTo(),
      isSourceLanguage: false,
    );
  }
}
