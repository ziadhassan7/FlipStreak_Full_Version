import 'package:flip_streak/business/print_debug.dart';
import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../data/model/tts_language_model.dart';

class TextToSpeechUtil {

  static FlutterTts flutterTts = FlutterTts();
  static bool isPlaying= false;

  static final HiveClient _hiveClient = HiveClient();

  static Future speak(String text) async{

    String sourceLanguage = _hiveClient.getLanguageSource();
    PrintDebug("ksfklam", await flutterTts.getLanguages);

    // Check if language is available, and not (auto)
    if(sourceLanguage != "Auto Detect"){
      String langCode = TTSLanguageModel.getLangCode(sourceLanguage) ?? "en-US";

      if(await flutterTts.isLanguageAvailable(langCode)){
        flutterTts.setLanguage(langCode);
        PrintDebug("ksfklam", "available");
      } else {
        PrintDebug("ksfklam", "not available");
      }
    }


    if(isPlaying){
      PrintDebug("ksfklam", "was playing");
      _stop();

    } else {
      await flutterTts.speak(text);

      PrintDebug("ksfklam", "was not playing");

      handleState();
    }
  }

  static Future _stop() async{
    await flutterTts.stop();
    isPlaying = false;
  }


  static handleState(){
    PrintDebug("ksfklam", "testing state?");
    flutterTts.setStartHandler(() {
      isPlaying = true;
      PrintDebug("ksfklam: playing", isPlaying);
    });

    flutterTts.setCompletionHandler(() {
      isPlaying = false;
      PrintDebug("ksfklam: stopped", isPlaying);
    });
  }

}