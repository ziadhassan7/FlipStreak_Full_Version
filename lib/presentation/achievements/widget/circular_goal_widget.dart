import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/styles/box_decoration.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';

class CircularGoalWidget extends StatelessWidget {
  const CircularGoalWidget({Key? key,
    required this.currentProgress, required this.goal}) : super(key: key);

  final int currentProgress;
  final int goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100,
      width: 100,

      decoration: CustomDecoration(
        borderColor: colorAccent,
        borderWidth: 4,
        isCircular: true,
        radius: 100,
      ),

      child: Center(child: TextInriaSans("$currentProgress/$goal", color: colorAccent, weight: FontWeight.bold, size: 18,)),
    );
  }
}
