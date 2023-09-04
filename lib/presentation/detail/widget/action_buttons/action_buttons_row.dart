import 'package:flip_streak/presentation/detail/widget/action_buttons/category_button.dart';
import 'package:flip_streak/presentation/detail/widget/action_buttons/read_button.dart';
import 'package:flutter/material.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({Key? key, this.size = 70}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        /// Button - Circular Favourite
        CategoryButton(size: size),

        /// Button - Continue Reading
        Expanded(child: ReadButton(height: size+10,)),

      ],
    );
  }
}
