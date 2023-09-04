import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/app_constants/hive_keys.dart';
import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flip_streak/presentation/index/index_page.dart';
import 'package:flip_streak/presentation/welcome/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'business/app_wise/streak/streak_state_util.dart';
import 'business/system_wise/system_util.dart';

Future<void> main() async {
  //When you are initializing any future function, it is better to call,
  //ensure initialized as your first line of code, before runApp(),
  //and your initializers
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(GLOBAL_DATA_BOX);

  //Update Streak
  StreakStateUtil.updateStreakState();

  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final HiveClient hiveClient = HiveClient();

  Widget getFirstScreen(){
    bool isAppFirstOpen = hiveClient.getFirstOpenState();

    if(isAppFirstOpen){
      return const WelcomeScreen();

    } else {
      return IndexPage();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemUtil.disableStatusBarColor();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlipStreak',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: colorAccent,
          onPrimary: colorSecondary,
          secondary: colorSecondary,
          onSecondary: colorPrimary,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),

      home: getFirstScreen(),
    );
  }
}
