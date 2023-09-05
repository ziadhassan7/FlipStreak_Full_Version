import 'package:flip_streak/business/notification_util.dart';

class StreakNotificationUtil {

  static const _scheduledId = 0;

  static scheduleNotificationOnCountdownState(){
    NotificationUtil.scheduleNotification(
        _scheduledId,
        const Duration(hours: 24),
        title: "Reminder",
        body: "You are about to lose your streak!");
  }

  static void cancelScheduledNotification(){
    NotificationUtil.cancelNotification(_scheduledId);
  }

  //Schedule Notification, But cancel any old one
  static void reScheduleNotification(){
    cancelScheduledNotification();
    scheduleNotificationOnCountdownState();
  }

}