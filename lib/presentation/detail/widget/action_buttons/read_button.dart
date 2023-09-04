import 'package:flip_streak/presentation/book/screen/book_page.dart';
import 'package:flutter/material.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../business/controllers/book_controller.dart';
import '../../../../business/route_util.dart';
import '../../../views/text_inria_sans.dart';

class ReadButton extends StatelessWidget {
  const ReadButton({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {

    final String buttonText = getCorrectText();

    return InkWell(

      onTap: (){
        // Open Book
        RouteUtil.navigateTo(context, const BookPage(),);
      },

      child: Container(
        height: height,
        decoration: const BoxDecoration(
            color: colorAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50),
            )),

        child: Row(
          children: [
            const Spacer(),

            TextInriaSans(
              buttonText,
              size: 21,
              color: Colors.white,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Icon(Icons.arrow_forward, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }

  String getCorrectText() {

    if (bookModel.isComplete == 1) {
      return "Re-discover"; //finished book

    } else {
      if (bookModel.lastPage == 0) {
        return "Start Reading"; //starting to read

      } else {
        return "Continue Reading"; //reading
      }
    }
  }
}
