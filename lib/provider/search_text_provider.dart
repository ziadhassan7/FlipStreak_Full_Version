import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchTextProvider = StateNotifierProvider<SearchTextProvider, int>((ref) {

  return SearchTextProvider();
});


class SearchTextProvider extends StateNotifier<int>{
  SearchTextProvider() : super(0);

  void searchIndex(int index) {

    state = index;
  }
}