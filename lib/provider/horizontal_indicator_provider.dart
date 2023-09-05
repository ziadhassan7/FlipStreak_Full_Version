import 'package:flutter_riverpod/flutter_riverpod.dart';

final horizontalIndicatorProvider = StateNotifierProvider<HorizontalIndicatorProvider, bool>((ref) {
  return HorizontalIndicatorProvider();
});


class HorizontalIndicatorProvider extends StateNotifier<bool>{
  HorizontalIndicatorProvider() : super(true); //Initial

  void showIndicator() => state = true;
  void hideIndicator() => state = false;
  void toggleIndicator() => state = !state;
}