class LanguageModel {
  //Key: Language  ,, Value: Code
  static final Map<String, String> languages = {
   "Auto Detect":"auto",
   "Arabic":"ar",
   "Bengali":"bn",
   "Chines":"zh",
   "Dutch":"nl",
   "English":"en",
   "French":"fr",
   "German":"de",
   "Hindi":"hi",
   "Indonesian":"id",
   "Italian":"it",
   "Japanese":"ja",
   "Korean":"ko",
   "Portuguese":"pt",
   "Russian":"ru",
   "Spanish":"es",
   "Swedish":"sv",
   "Turkish":"tr",
   "Urdu":"ur",
 };

  static List<String> getList(){
    return languages.keys.toList();
  }

  static String? getLangCode(String languageName){
    return languages[languageName]; //get code
  }
 }