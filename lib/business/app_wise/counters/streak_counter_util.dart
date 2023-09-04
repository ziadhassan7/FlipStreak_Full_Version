import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/shared_pref/hive_client.dart';
import '../../../provider/streak_provider.dart';
import '../streak/streak_state_util.dart';

class StreakCounterUtil {
  static final HiveClient _hive = HiveClient();
  //Temp variables (hold temporary values)
  static late int streakCounter;
  static late int flipCounterTrigger;

  /// Update Streak Counter ,, Only on first flip
  static void updateStreakOnFirstFlip(WidgetRef ref){
    flipCounterTrigger = _hive.getFlipCounter();

    //Trigger streak update only on the fist flip.
    if(flipCounterTrigger == 1){
      // update Streak Status
      StreakStateUtil.updateStreakState();
      StreakStateUtil.updateWithNewDate(DateTime.now());
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