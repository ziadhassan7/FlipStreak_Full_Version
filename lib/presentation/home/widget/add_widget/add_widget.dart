import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/home/widget/add_widget/add_btn.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';


class AddWidget extends StatelessWidget {
  const AddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,),

      child: Container(
        width: getWidgetAdaptiveWidth(context),

        decoration: const BoxDecoration(
          color: colorSecondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), bottomLeft: Radius.circular(24),
          )),


        child: Row(
          children: [
            const Spacer(),

            TextInriaSans(
              "Add new books",
              size: 23,
              weight: FontWeight.bold,
            ),

            AddIconButton(),
          ],
        ),
      ),
    );
  }


  double getWidgetAdaptiveWidth(context){
    double screenWidth = MediaQuery.of(context).size.width;

    //on breakpoint
    if(screenWidth > 450){
      return 400;

    } else {
      return screenWidth *0.9;
    }
  }
}
