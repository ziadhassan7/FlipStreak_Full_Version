import 'package:flip_streak/business/app_wise/controllers/book_controller.dart';
import 'package:flip_streak/presentation/achievements/view/today_goal_widget.dart';
import 'package:flip_streak/presentation/achievements/view/top_widget.dart';
import 'package:flip_streak/provider/book_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../data/model/book_model.dart';
import '../view/book_goal_widget.dart';
import '../view/completed_books_widget.dart';

class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Future<List<BookModel>> books = ref.watch(bookListProvider);

    return Scaffold(
      backgroundColor: colorPrimary.withOpacity(0.4),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AchievementTopWidget(),

              const TodayGoalWidget(),


              FutureBuilder(
                future: getCompletedBooks(books),
                builder: (context, AsyncSnapshot snapshot) {


                  if(snapshot.hasData){

                    return snapshot.data!.isNotEmpty
                        ? Column(
                            children: [
                              BookGoalWidget(completedBooks: getCompletedOnly(snapshot.data!).length,),

                              CompletedBooksWidget(books: snapshot.data!)
                            ],
                          )

                        : const BookGoalWidget(completedBooks: 0,);

                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
              )
            ],
          ),
        ),
      )
    );
  }

  Future<List<BookModel>> getCompletedBooks(Future<List<BookModel>> providerBooks) async {
    final List<BookModel> allBooks = await providerBooks;

    return getCompletedOnly(allBooks);
  }
}
