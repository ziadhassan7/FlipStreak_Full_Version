import 'package:flutter/widgets.dart';

class CustomPadding extends EdgeInsets{
  const CustomPadding.all(super.value) : super.all();

  const CustomPadding({double ver=0, double hor=0}) : super.symmetric(vertical: ver, horizontal: hor);

}