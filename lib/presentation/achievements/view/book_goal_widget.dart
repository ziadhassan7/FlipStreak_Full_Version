import 'package:flip_streak/presentation/achievements/widget/goal_widget.dart';
import 'package:flutter/material.dart';

class BookGoalWidget extends StatelessWidget {
  const BookGoalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoalWidget(
        title: "Books' Goal",
        info: "Number of books you've read this year.",
        currentProgress: 4,
        goal: 5,
        onEditPress: (){

        },

        showTotalPagesCount: true,
    );
  }
}
