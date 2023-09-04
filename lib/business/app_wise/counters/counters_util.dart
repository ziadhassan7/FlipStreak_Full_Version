import 'package:flip_streak/app_constants/hive_keys.dart';
import 'package:flip_streak/business/app_wise/counters/streak_counter_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/shared_pref/hive_client.dart';

class CountersUtil {
  static final HiveClient _hive = HiveClient();
  static int _pageReadCounterForBook = 0;


  static void updateCounters(WidgetRef ref, {required bool isIncrement}){
    int streakState = _hive.getStreakState(); //get state

    switch(streakState) {
      case SAME_DATE_STATE:
        incrementCounters(isIncrement);
        StreakCounterUtil.updateStreakOnFirstFlip(ref);
        break;

      case COUNTDOWN_STATE:
        _hive.resetFlipCounter();
        _hive.resetPageReadCounter();
        incrementCounters(isIncrement);
        StreakCounterUtil.updateStreakOnFirstFlip(ref);
        break;

      case ENDED_STATE:
        resetAllCounter(ref);
        incrementCounters(isIncrement);
        break;

      default:
        print("Streak State Error");
    }

  }

  /// How many pages you've read Today
  static void incrementCounters(bool isIncrease){
    isIncrease
        ? _pageReadCounterForBook++ //increase a page
        : _pageReadCounterForBook--; //decrease a page

    //Pages Read Today
    _hive.updatePageReadCounter(_pageReadCounterForBook);
    //Flips in general (Trigger for first flip)
    _hive.increaseFlipCounter();
  }


  /// Reset
  static void resetAllCounter(WidgetRef ref){
    _hive.resetPageReadCounter(); //how much you read today
    _hive.resetFlipCounter(); //number of pages flipped
    StreakCounterUtil.resetStreak(ref);
  }

}