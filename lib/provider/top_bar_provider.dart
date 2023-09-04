import 'package:flutter_riverpod/flutter_riverpod.dart';

final topBarProvider = StateNotifierProvider<TopBarProvider, bool>((ref) {

  return TopBarProvider();
});


class TopBarProvider extends StateNotifier<bool>{
  TopBarProvider() : super(false);

  void toggle() {

    state = !state;
  }

  void keepOpen() {

    state = true;
  }

  void keepClosed() {

    state = false;
  }
}