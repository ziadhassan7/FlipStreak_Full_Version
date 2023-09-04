import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationUtil {

  static final _notification = FlutterLocalNotificationsPlugin();


  static Future<void> showNotification ({required String title}) async {

    requestPermission().then((value) =>

        _notification.show(
            0,
            title,
            "This is your code",
            _getNotificationDetail()
        ));

  }

  //Notification Details
  static _getNotificationDetail(){
    return const NotificationDetails(
      android: AndroidNotificationDetails(
          "0", //Channel ID
          "main_channel", //Channel Name
          channelDescription: "some description",
          importance: Importance.max
      ),
    );
  }

  //Request Permissions, for android 13 or higher
  static Future<void> requestPermission() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
  }


  /// Initialize in your main(), after WidgetsFlutterBinding.ensureInitialized();
  static init() async {

    const AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings('launch_background');
    // your app icon should be in
    //android/app/src/main/res/drawable

    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid);

    await _notification.initialize(initializationSettings);
  }

}