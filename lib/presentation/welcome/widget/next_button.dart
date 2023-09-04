import 'package:flip_streak/provider/pages_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/route_util.dart';
import '../../../data/shared_pref/hive_client.dart';
import '../../../provider/books_goal_provider.dart';
import '../../../provider/welcome_screen_provider.dart';
import '../../index/index_page.dart';
import '../../views/text_inria_sans.dart';

class NextButton extends ConsumerWidget {
  const NextButton(this.currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String text = (currentPage == Pages.thirdPage) ? "Finish" : "Next";

    return TextButton(
      onPressed: ()=> nextButtonPressed(context, ref, currentPage),

      child: TextInriaSans(
        text,
        color: colorAccent,
        weight: FontWeight.bold,
        size: 18,
      ),
    );
  }

  /// Next
  nextButtonPressed(BuildContext context, WidgetRef ref, Pages currentPage){
    HiveClient hiveClient = HiveClient();

    switch(currentPage){

      case Pages.firstPage:
        //Save Pages' Goal
        int pagesGoal = ref.watch(pagesGoalProvider);
        hiveClient.updatePagesGoal(pagesGoal);
        //Move to Books' Goal Page
        ref.read(welcomeScreenProvider.notifier).changeIndex(Pages.secondPage);
        break;

      case Pages.secondPage:
        //Save Books' Goal
        int booksGoal = ref.watch(booksGoalProvider);
        hiveClient.updateBooksGoal(booksGoal);
        //Move to Notification Page
        ref.read(welcomeScreenProvider.notifier).changeIndex(Pages.thirdPage);
        break;

      case Pages.thirdPage:
        //Navigate to Home Page
        RouteUtil.navigateTo(context, IndexPage(), isReplace: true);
        //App First Open: false
        hiveClient.updateFirstOpenState();
        break;
    }
  }

}
