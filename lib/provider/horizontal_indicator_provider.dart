import 'package:flutter_riverpod/flutter_riverpod.dart';

final horizontalIndicatorProvider = StateNotifierProvider<HorizontalIndicatorProvider, bool>((ref) {
  return HorizontalIndicatorProvider();
});


class HorizontalIndicatorProvider extends StateNotifier<bool>{
  static bool currentValue = true;

  HorizontalIndicatorProvider() : super(currentValue); //Initial

  void showIndicator() => state = currentValue = true;
  void hideIndicator() => state = currentValue = false;
}