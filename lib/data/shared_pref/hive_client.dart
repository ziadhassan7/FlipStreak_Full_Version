import 'package:flip_streak/app_constants/hive_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveClient {

  late Box globalBox;

  HiveClient(){
    globalBox = Hive.box(GLOBAL_DATA_BOX);
  }



  /// --------------------------------------------------------------------------/ App First Open?

  Future<void> updateFirstOpenState() async {
    bool newValue = false;
    await globalBox.put(FIRST_OPEN_STATE, newValue);
  }

  bool getFirstOpenState() {
    return globalBox.get(FIRST_OPEN_STATE, defaultValue: true);
  }

  /// --------------------------------------------------------------------------/ Streak Counter

  void updateStreakCounter(int value) {
    globalBox.put(STREAK_COUNTER, value);
  }

  void resetStreakCounter() {
    globalBox.put(STREAK_COUNTER, 0);
  }

  int getStreakCounter() {
    return globalBox.get(STREAK_COUNTER, defaultValue: 0);
  }


  /// --------------------------------------------------------------------------/ Streak State

  void updateStreakState(int state) {
    globalBox.put(STREAK_STATE, state);
  }

  int getStreakState() {
    return globalBox.get(STREAK_STATE, defaultValue: ENDED_STATE);
  }

  /// --------------------------------------------------------------------------/ First Flip Trigger

  void increaseFlipCounter() {
    int saved = getFlipCounter();
    globalBox.put(FIRST_TIME_FLIP, saved+1);
  }

  void resetFlipCounter() {
    globalBox.put(FIRST_TIME_FLIP, 0);
  }

  int getFlipCounter() {
    return globalBox.get(FIRST_TIME_FLIP, defaultValue: 0);
  }

  /// --------------------------------------------------------------------------/ Pages Read Today

  void updatePageReadCounter(int value) {
    globalBox.put(PAGE_READ_TODAY, value);
  }

  void resetPageReadCounter() {
    globalBox.put(PAGE_READ_TODAY, 0);
  }

  int getPageReadCounter() {
    return globalBox.get(PAGE_READ_TODAY, defaultValue: 0);
  }


  /// --------------------------------------------------------------------------/ Last Saved Date

  void putLastDate(DateTime value) {
    globalBox.put(LAST_SAVED_DATE, value);
  }

  DateTime getLastDate() {
    return globalBox.get(LAST_SAVED_DATE, defaultValue: DateTime.now());
  }



  /// --------------------------------------------------------------------------/ Last Saved Book

  void saveLastBook(String id) {
    globalBox.put(LAST_SAVED_BOOK, id);
  }

  Future<String> getLastBook() async {
    return await globalBox.get(LAST_SAVED_BOOK, defaultValue: "");
  }

  Future<void> deleteLastBook() async {
    return await globalBox.delete(LAST_SAVED_BOOK);
  }

  /// --------------------------------------------------------------------------/ Last Page

  void updateLastPage(int page)  {
    globalBox.put(LAST_PAGE, page);
  }

  Future<int> getLastPage() async {
    return await globalBox.get(LAST_PAGE, defaultValue: 0);
  }


  /// --------------------------------------------------------------------------/ Books' Categories

  Future<void> updateCategories(List newCategoriesList) async {
    await globalBox.put(BOOKS_CATEGORIES, newCategoriesList);
  }

  Future<List> getCategories() async {
    return await globalBox.get(BOOKS_CATEGORIES, defaultValue: []);
  }


  /// --------------------------------------------------------------------------/ Books' Goal

  void updateBooksGoal(int newValue) {
    globalBox.put(BOOKS_GOAL, newValue);
  }

  int getBooksGoal() {
    return globalBox.get(BOOKS_GOAL, defaultValue: 1);
  }

  /// --------------------------------------------------------------------------/ Pages' Goal

  void updatePagesGoal(int newValue) {
    globalBox.put(PAGES_GOAL, newValue);
  }

  int getPagesGoal() {
    return globalBox.get(PAGES_GOAL, defaultValue: 1);
  }


  /// --------------------------------------------------------------------------/ Language
  //Source
  void updateLanguageSource(String newValue) {
    globalBox.put(LANGUAGE_SOURCE, newValue);
  }

  String getLanguageSource() {
    return globalBox.get(LANGUAGE_SOURCE, defaultValue: "Auto Detect");
  }

  //To
  void updateLanguageTo(String newValue) {
    globalBox.put(LANGUAGE_TO, newValue);
  }

  String getLanguageTo() {
    return globalBox.get(LANGUAGE_TO, defaultValue: "Arabic");
  }
}