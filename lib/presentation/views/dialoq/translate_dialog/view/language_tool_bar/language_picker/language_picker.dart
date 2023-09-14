import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flutter/material.dart';
import '../../../../../../../data/model/language_model.dart';

class LanguagePicker extends StatefulWidget {
  LanguagePicker({Key? key, required this.currentLanguage, required this.isSourceLanguage}) : super(key: key);

  String currentLanguage;
  final bool isSourceLanguage;

  @override
  State<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {

  final HiveClient _hiveClient = HiveClient();
  late List<String> languages;

  @override
  Widget build(BuildContext context) {

    if(widget.isSourceLanguage){
      languages = LanguageModel.getList();
    } else {
      languages = getListOfLanguagesWithoutAuto();
    }


    return DropdownButton(
      menuMaxHeight: 300,

      // Initial Value
      value: widget.currentLanguage,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: languages.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),

      //Listen to changes
      onChanged: (String? newValue) {
        setState(() {
          widget.currentLanguage = newValue!;
          updatePreferenceLanguage(newValue);
        });
      },
    );
  }

  void updatePreferenceLanguage(String newValue) {
    if(widget.isSourceLanguage){
      _hiveClient.updateLanguageSource(newValue);
    } else {
      _hiveClient.updateLanguageTo(newValue);
    }
  }

  List<String> getListOfLanguagesWithoutAuto(){
    List<String> list = LanguageModel.getList();
    list.remove("Auto Detect");
    return list;
  }
}
