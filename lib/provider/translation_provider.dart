import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_constants/locals.dart';
import '../business/app_wise/translate_util.dart';

final translationProvider = StateNotifierProvider<TranslationProvider, Future<String>>((ref) {

  return TranslationProvider(); //get streak score
});



class TranslationProvider extends StateNotifier<Future<String>>{

  TranslationProvider() : super(Future(() => "")); //pass streak as the initial value


  Future<void> translate(String? text, {String fromLanguage = languageAuto,
    String toLanguage = languageArabic,}) async {


    state = TranslateUtil.translate(
        text, fromLanguage: fromLanguage, toLanguage: toLanguage);
  }

}