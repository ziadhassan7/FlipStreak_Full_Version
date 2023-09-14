import 'package:flip_streak/data/model/language_model.dart';
import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:translator_plus/translator_plus.dart';

class TranslateUtil {

  static final HiveClient _hiveClient = HiveClient();
  static final translator = GoogleTranslator();

  static Future<String> translate(String? text,) async {

    // Get Current Language
    String source = _getSourceLangCode();
    String to = _getToLangCode();

    // Translate
    var translation = await translator.translate(text!, from: source, to: to);

    return translation.text;
  }

  //Fire up translation
  static init() async {
    await translator.translate(".", from: "en", to: "en");
  }

  static _getSourceLangCode(){
    return LanguageModel.getLangCode(_hiveClient.getLanguageSource());
  }

  static _getToLangCode(){
    return LanguageModel.getLangCode(_hiveClient.getLanguageTo());
  }

}