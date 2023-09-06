import 'package:flip_streak/app_constants/hive_keys.dart';
import 'package:flip_streak/business/app_wise/counters/streak_counter_util.dart';
import 'package:flip_streak/provider/pages_read_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/shared_pref/hive_client.dart';

class CountersUtil {
  static final HiveClient _hive = HiveClient();
  static bool firstOpen = true;


  static void updateCounters(WidgetRef ref, {required bool isIncrement}){
    int streakState = _hive.getStreakState(); //get state

    switch(streakState) {
      case SAME_DATE_STATE:
        incrementCounters(ref, isIncrement);
        StreakCounterUtil.updateStreakOnFirstFlip(ref);
        break;

      case COUNTDOWN_STATE:
        _hive.resetFlipCounter();
        ref.read(pagesReadProvider.notifier).reset();
        incrementCounters(ref, isIncrement);
        StreakCounterUtil.updateStreakOnFirstFlip(ref);
        break;

      case ENDED_STATE:
        resetAllCounter(ref);
        incrementCounters(ref, isIncrement);
        break;

      default:
        print("Streak State Error");
    }

  }

  /// How many pages you've read Today
  static void incrementCounters(WidgetRef ref, bool isIncrease){

    int pageReadCounter = _hive.getPageReadCounter();

    if(isIncrease){
      pageReadCounter++; //increase a page

    } else {
      if(!firstOpen){
        pageReadCounter--; //decrease a page, unless it's first open
      }
    }

    //Flips in general (Trigger for first flip)
    if(!firstOpen){
      ref.read(pagesReadProvider.notifier).update(pageReadCounter);
      _hive.increaseFlipCounter();
    }

    firstOpen = false; //Now it's not first open
  }


  /// Reset
  static void resetAllCounter(WidgetRef ref){
    ref.read(pagesReadProvider.notifier).reset(); //how much you read today
    _hive.resetFlipCounter(); //number of pages flipped
    StreakCounterUtil.resetStreak(ref);
  }

  /// Reset
  static void resetFirstOpen(){
    firstOpen = true;
  }

}