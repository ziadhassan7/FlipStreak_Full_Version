import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightModeProvider = StateNotifierProvider<BrightModeProvider, bool>((ref) {

  return BrightModeProvider();
});


class BrightModeProvider extends StateNotifier<bool>{
  BrightModeProvider() : super(true);

  void changeIndex(int index) {

    if (index == 0 || index == 1) state = true; //bright
    if (index == 2 || index == 3) state = false; //dark
  }
}