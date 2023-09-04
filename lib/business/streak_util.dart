import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/shared_pref/hive_client.dart';
import '../provider/streak_provider.dart';
import 'date_util.dart';

class StreakHandler {
  static final HiveClient _hive = HiveClient();
  //Temp variables (hold temporary values)
  static late int streakCounter;
  static late int flipCounterTrigger;

  /// Streak Counter
  static void updateStreak(WidgetRef ref){
    flipCounterTrigger = _hive.getFlipCounter();

    //Trigger streak update only on the fist flip.
    if(flipCounterTrigger == 1){
      // update Streak Status
      DateUtil.updateStreakState();
      DateUtil.updateWithNewDate(DateTime.now());
      //increment streak
      streakCounter = _hive.getStreakCounter();
      _hive.updateStreakCounter(streakCounter +1);
      //update provider
      ref.read(streakProvider.notifier).notifyNewStreak();// trigger provider
    }

  }


  /// Reset Streak
  static void resetStreak(WidgetRef ref){
    _hive.resetStreakCounter();

    ref.read(streakProvider.notifier).notifyNewStreak();// trigger provider
  }
}