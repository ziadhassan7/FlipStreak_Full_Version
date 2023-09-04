import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({Key? key, required this.onTap, required this.color, required this.icon,}) : super(key: key);

  final Function()? onTap;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color, // Button Color

        child: InkWell(
          onTap: onTap, // Button Function

          child: SizedBox(
            width: 56,
            height: 56,

            child: icon, // Button Icon
          ),
        ),
      ),
    );
  }
}
