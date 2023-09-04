import 'package:flip_streak/app_constants/hive_keys.dart';
import '../../data/shared_pref/hive_client.dart';

class DateUtil {

  static final HiveClient _hive = HiveClient();

  static void updateStreakState(){
    //Current Date
    DateTime currentDate = DateTime.now();
    //Last Saved Date
    DateTime lastSavedDate = _hive.getLastDate();
    //Durations
    Duration remainder = currentDate.difference(lastSavedDate).abs();
    Duration hoursMin = const Duration(hours: 24);
    Duration hoursMax = const Duration(hours: 56);

    print("STREAK_LOG [state]: lastDate $lastSavedDate");
    print("STREAK_LOG [state]: duration $remainder");

    if(remainder < hoursMin) {
      _hive.updateStreakState(SAME_DATE_STATE);

    } else if (remainder > hoursMin  &&  remainder < hoursMax){
      _hive.updateStreakState(COUNTDOWN_STATE);

    }else if (remainder > hoursMax){
      _hive.updateStreakState(ENDED_STATE);
      resetAllCounter();
    }

    print("STREAK_LOG [state]: state ${_hive.getStreakState()}");
  }

  static void updateWithNewDate(DateTime newDate){
    _hive.putLastDate(newDate);
  }


  static void resetAllCounter(){
    _hive.resetPageReadCounter();
    _hive.resetFlipCounter();
    _hive.resetStreakCounter();

    print("STREAK_LOG [reset]: reset all (with no update)");
  }

}


