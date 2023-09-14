class TTSLanguageModel {
  //Key: Language  ,, Value: Code
  static final Map<String, String> languages = {
    "Auto Detect":"auto",
    "Arabic":"ar",
    "Bengali":"bn-BD",
    "Chines":"zh-CN",
    "Dutch":"nl-NL",
    "English":"en-US",
    "French":"fr-FR",
    "German":"de-DE",
    "Hindi":"hi-IN",
    "Indonesian":"id-ID",
    "Italian":"it-IT",
    "Japanese":"ja-JP",
    "Korean":"ko-KR",
    "Portuguese":"pt-PT",
    "Russian":"ru-RU",
    "Spanish":"es-ES",
    "Swedish":"sv-SE",
    "Turkish":"tr-TR",
    "Urdu":"ur-PK",
  };

  static List<String> getList(){
    return languages.keys.toList();
  }

  static String? getLangCode(String languageName){
    return languages[languageName]; //get code
  }
}