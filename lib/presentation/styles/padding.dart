import 'package:flutter/widgets.dart';

class CustomPadding extends EdgeInsets{

  const CustomPadding({double ver=0, double hor=0}) : super.symmetric(vertical: ver, horizontal: hor);

  const CustomPadding.all(super.value) : super.all();

  const CustomPadding.only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
    double? horizontal,
    double? vertical,

  }) : super.only(
    left: horizontal ?? left,
    right: horizontal ?? right,
    top: vertical ?? top,
    bottom: vertical ?? bottom,
  );
}