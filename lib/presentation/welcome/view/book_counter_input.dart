import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/books_goal_provider.dart';
import '../../../provider/welcome_screen_provider.dart';
import '../../views/dialoq/picker_dialog/picker_dialog.dart';
import '../widget/counter_input.dart';

class BooksCounterInput extends ConsumerWidget {
  const BooksCounterInput(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGoal = ref.watch(booksGoalProvider);

    return CounterInput(
        currentGoal: currentGoal.toString(),

        decreaseFunction: (){
          ref.read(booksGoalProvider.notifier).decreaseGoal();
        },

        counterPickerFunction: (){
          PickerDialog(
              context,
              title: "Your Goal",
              initialValue: currentGoal,
              maxValue: 1000,
              onSave: (value){
                ref.read(booksGoalProvider.notifier).changeGoal(value);
              }
          );
        },

        increaseFunction: (){
          ref.read(booksGoalProvider.notifier).increaseGoal();
        }
    );
  }
}
