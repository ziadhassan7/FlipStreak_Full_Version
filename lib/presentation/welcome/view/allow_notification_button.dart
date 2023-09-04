import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/business/notification_util.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';

class AllowNotificationButton extends StatelessWidget {
  const AllowNotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: MediaQuery.sizeOf(context).width * 0.7,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const StadiumBorder(), backgroundColor: colorAccent),

        onPressed: (){
          NotificationUtil.requestPermission();
        },

        child: TextInriaSans("Allow Notification", color: Colors.white, size: 16,),
      ),
    );
  }
}
