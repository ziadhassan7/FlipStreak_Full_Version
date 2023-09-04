import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageSelectionProvider = StateNotifierProvider<PageSelectionProvider, int>((ref) {

  return PageSelectionProvider();
});


class PageSelectionProvider extends StateNotifier<int>{
  PageSelectionProvider() : super(0);

  void toggleTopbar(int barIndex,) async {
    print("topbar provider");

    state = barIndex;
  }
}