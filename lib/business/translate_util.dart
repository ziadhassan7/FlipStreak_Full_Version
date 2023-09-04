import 'package:simplytranslate/simplytranslate.dart';
import '../../app_constants/locals.dart';

class TranslateUtil {

  static Future<String> translate(String? text,
      {String fromLanguage = languageAuto, String toLanguage = languageArabic,}) async {

    final gt = SimplyTranslator(EngineType.google);


    String textResult = await gt.trSimply(
        text!,
        'en', //<------ auto may cause a problem
        'ar');

    return textResult;
  }

}