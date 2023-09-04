import 'package:flutter/material.dart';
import '../../../../app_constants/color_constants.dart';
import '../../views/heading_image.dart';
import '../../views/text_inria_sans.dart';

class AchievementTopWidget extends StatelessWidget {
  const AchievementTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 54, left: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInriaSans("Your", size: 28, color: colorAccent,),
                TextInriaSans("Finished Books", weight: FontWeight.bold, size: 30, color: colorAccent,),
              ],
            ),),


          const Align(
              alignment: AlignmentDirectional.topEnd,
              child: HeadingImage("assets/headings/achievement_heading.svg", haveSpaceOnTop: true,)),
        ],
      ),
    );
  }
}
