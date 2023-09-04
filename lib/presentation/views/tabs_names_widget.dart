import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({Key? key, required this.tabList, required this.isRoundedBorder}) : super(key: key);

  final List<String> tabList;
  final bool isRoundedBorder;

  @override
  Widget build(BuildContext context) {
    return Theme(

      data: ThemeData(
        splashColor: Colors.transparent,
      ),

      child: TabBar(
        splashBorderRadius: isRoundedBorder
          ? const BorderRadius.all(Radius.circular(25))
          : null,

        labelColor: colorAccent,
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),

        indicatorColor: colorAccent,
        unselectedLabelColor: Colors.black54,

          indicatorSize: TabBarIndicatorSize.label,

          indicator: isRoundedBorder
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: colorAccent.withOpacity(0.1))
            : null,


        tabs: [
          for (String element in tabList)
            isRoundedBorder
              ? SizedBox(
                  width: 200,
                  child: Tab(text: element,))

              : Tab(text: element,),
        ]),
    );
  }
}