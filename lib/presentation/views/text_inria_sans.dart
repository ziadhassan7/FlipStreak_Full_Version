import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_constants/color_constants.dart';

class TextInriaSans extends StatelessWidget {

  String text;
  double? size;
  FontWeight? weight;
  Color? color;
  int? maxLine;
  bool? softWrap;
  TextOverflow? overflow;
  TextAlign? textAlign;
  TextDirection? textDirection;


  TextInriaSans(
      this.text,
      {
        Key? key,
        this.size,
        this.weight,
        this.color = colorDark,
        this.maxLine,
        this.softWrap,
        this.overflow = TextOverflow.ellipsis,
        this.textAlign,
        this.textDirection,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: softWrap,
      textDirection: textDirection,

      style: GoogleFonts.inriaSans(
        textStyle: TextStyle(
            fontSize: size,
            fontWeight: weight,
            overflow: overflow,
            color: color,
        ),
      )

    );
  }
}

