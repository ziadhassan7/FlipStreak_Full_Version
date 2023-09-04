import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../../views/text_inria_sans.dart';
import '../../../provider/welcome_screen_provider.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// Info
          TextInriaSans(getTitle(), size: 30, color: colorAccent, ),

          const SizedBox(height: 10,),

          TextInriaSans(getInfo(), size: 16, color: Colors.black87, maxLine: 4,),
        ],
      ),
    );
  }

  getTitle(){
    switch(currentPage){
      case Pages.firstPage:
        return "Pages' Goal";
      case Pages.secondPage:
        return "Books Goal";
      case Pages.thirdPage:
        return "Notification";
    }
  }


  getInfo(){
    switch(currentPage){
      case Pages.firstPage:
        return "The number of pages you want to read every read";
      case Pages.secondPage:
        return "The number of books you want to read this year";
      case Pages.thirdPage:
        return "Get reminded if you are going to loose your streak";
    }
  }
}
