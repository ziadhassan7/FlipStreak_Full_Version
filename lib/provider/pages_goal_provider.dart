import 'package:flutter_riverpod/flutter_riverpod.dart';

final pagesGoalProvider = StateNotifierProvider<PagesGoalProvider, int>((ref) {

  return PagesGoalProvider();
});


class PagesGoalProvider extends StateNotifier<int>{
  PagesGoalProvider() : super(1);

  void increaseGoal() => state++;

  void decreaseGoal() {
    if(state >1) state--;
  }

  void changeGoal(value) => state = value;

  get goal => state;
}