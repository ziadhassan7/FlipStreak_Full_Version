import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCategoryProvider = StateNotifierProvider<CurrentCategoryProvider, String>((ref) {

  return CurrentCategoryProvider();
});


class CurrentCategoryProvider extends StateNotifier<String>{

  CurrentCategoryProvider() : super("All");

  void updateCategory(String item) => state = item;

}