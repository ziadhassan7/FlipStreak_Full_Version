import 'package:flip_streak/presentation/styles/box_decoration.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';

class CircularGoalWidget extends StatelessWidget {
  const CircularGoalWidget({Key? key,
    required this.currentProgress, required this.goal, required this.color}) : super(key: key);

  final int currentProgress;
  final int goal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100,
      width: 100,

      decoration: CustomDecoration(
        borderColor: color,
        borderWidth: 4,
        isCircular: true,
        radius: 100,
      ),

      child: Center(child: TextInriaSans("$currentProgress/$goal", color: color, weight: FontWeight.bold, size: 18,)),
    );
  }
}
