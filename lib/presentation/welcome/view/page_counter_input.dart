import 'package:flip_streak/presentation/welcome/widget/counter_input.dart';
import 'package:flip_streak/provider/pages_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/welcome_screen_provider.dart';
import '../../views/dialoq/picker_dialog/picker_dialog.dart';

class PagesCounterInput extends ConsumerWidget {
  const PagesCounterInput(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGoal = ref.watch(pagesGoalProvider);

    return CounterInput(
      currentGoal: currentGoal.toString(),

      decreaseFunction: (){
        ref.read(pagesGoalProvider.notifier).decreaseGoal();
      },

      counterPickerFunction: (){
        PickerDialog(
          context,
          title: "Your Goal",
          initialValue: currentGoal,
          maxValue: 1000,
          onSave: (value){
            ref.read(pagesGoalProvider.notifier).changeGoal(value);
          }
        );
      },

      increaseFunction: (){
        ref.read(pagesGoalProvider.notifier).increaseGoal();
      }
    );
  }
}
