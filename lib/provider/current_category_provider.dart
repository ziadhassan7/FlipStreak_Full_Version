import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCategoryProvider = StateNotifierProvider<CurrentCategoryProvider, String>((ref) {

  return CurrentCategoryProvider();
});


class CurrentCategoryProvider extends StateNotifier<String>{

  CurrentCategoryProvider() : super("All");


  Future<void> updateCategory(String item) async {
    state = item;
  }

}