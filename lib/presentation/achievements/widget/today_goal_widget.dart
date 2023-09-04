import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/achievements/widget/circular_goal_widget.dart';
import 'package:flip_streak/presentation/styles/box_decoration.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';

class TodayGoalWidget extends StatelessWidget {
  const TodayGoalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(hor: 30, ver: 40),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,

        children: [
          TextInriaSans("Today's Goal", size: 22,),

          alignmentWidget(),

          Container(
            padding: const CustomPadding.all(20),

            decoration: CustomDecoration(
              backgroundColor: Colors.white, //colorBackground
              radius: 30,
              borderWidth: 2,
              borderColor: colorAccent.withOpacity(0.4)
            ),

            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: TextInriaSans("Number of pages read today.", size: 16, overflow: TextOverflow.visible,)),

                const SizedBox(width: 10,),

                const CircularGoalWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget alignmentWidget(){
    return const SizedBox(height: 20,);
  }
}
