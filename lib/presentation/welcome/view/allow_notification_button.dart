import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/business/notification_util.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import '../../../business/route_util.dart';
import '../../../data/shared_pref/hive_client.dart';
import '../../index/index_page.dart';

class AllowNotificationButton extends StatelessWidget {
  const AllowNotificationButton({Key? key}) : super(key: key);

  static final HiveClient hiveClient = HiveClient();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: MediaQuery.sizeOf(context).width * 0.7,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const StadiumBorder(), backgroundColor: colorAccent),

        onPressed: (){
          // Request user to allow notifications,
          // if permitted! automatically move to home screen
          actAsFinishButton(context);
        },

        child: TextInriaSans("Allow Notification", color: Colors.white, size: 16,),
      ),
    );
  }

  void actAsFinishButton(BuildContext context){
    NotificationUtil.requestPermission().then((value) {
      //Navigate to Home Page
      RouteUtil.navigateTo(context, IndexPage(), isReplace: true);
      //App First Open: false
      hiveClient.updateFirstOpenState();
    });
  }
}
