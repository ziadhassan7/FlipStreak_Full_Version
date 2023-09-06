import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/styles/box_decoration.dart';
import 'package:flip_streak/presentation/styles/padding.dart';
import 'package:flip_streak/presentation/views/context_menu/view/menu_item.dart';
import 'package:flutter/material.dart';

enum MenuItem {
  Copy,
  Note,
  Translate
}

class ContextMenuView extends StatelessWidget {
  const ContextMenuView({Key? key, required this.selectedText,}) : super(key: key);

  final String selectedText;
  final double radius = 15;
  final double elevation = 15;

  @override
  Widget build(BuildContext context,) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius),),
      elevation: elevation,
      color: Colors.white,

      child: Container(
        width: 260, height: 50,
        padding: const CustomPadding(ver: 8, hor: 15),
        decoration: CustomDecoration(
          radius: radius,
          backgroundColor: colorAccent.withOpacity(0.05)
        ),

        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
            itemCount: MenuItem.values.length,

            itemBuilder: (context, index) {
              return ContextMenuItem(
                  currentItem: MenuItem.values[index],
                  selectedText: selectedText);
              },
        )
      ),
    );
  }
}