import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksGoalProvider = StateNotifierProvider<BooksGoalProvider, int>((ref) {

  return BooksGoalProvider();
});


class BooksGoalProvider extends StateNotifier<int>{
  BooksGoalProvider() : super(1);

  void increaseGoal() => state++;

  void decreaseGoal() {
    if(state >1) state--;
  }

  void changeGoal(value) => state = value;

  get goal => state;
}