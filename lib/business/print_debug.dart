import 'package:flutter/foundation.dart';

class PrintDebug {
  PrintDebug.log(String tag, dynamic obj){
    if (kDebugMode) {
      print("$tag:  $obj");
    }
  }
}