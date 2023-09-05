import 'package:flip_streak/presentation/achievements/widget/goal_widget.dart';
import 'package:flutter/material.dart';

class TodayGoalWidget extends StatelessWidget {
  const TodayGoalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoalWidget(
        title: "Today's Goal",
        info: "Number of pages read today.",
        currentProgress: 4,
        goal: 5,
        onEditPress: (){

        }
    );
  }
}
