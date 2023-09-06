import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectTextProvider = StateNotifierProvider<SelectTextProvider, bool>((ref) {

  return SelectTextProvider();
});


class SelectTextProvider extends StateNotifier<bool>{
  SelectTextProvider() : super(false);

  void selected() => state = true;
  void deselect() => state = false;

  void toggle() => state = !state;

}