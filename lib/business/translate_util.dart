import 'package:translator_plus/translator_plus.dart';
import '../../app_constants/locals.dart';

class TranslateUtil {

  static Future<String> translate(String? text,
      {String fromLanguage = languageAuto, String toLanguage = languageArabic,}) async {

    final translator = GoogleTranslator();

    var translation = await translator.translate(text!, from: 'en', to: 'ar');

    return translation.text;
  }

}