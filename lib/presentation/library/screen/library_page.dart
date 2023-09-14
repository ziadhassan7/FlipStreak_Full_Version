import 'package:flip_streak/data/shared_pref/hive_client.dart';
import 'package:flip_streak/presentation/library/widget/list_item.dart';
import 'package:flip_streak/presentation/library/widget/top_widget.dart';
import 'package:flip_streak/presentation/views/dialoq/category_menu/category_menu.dart';
import 'package:flip_streak/presentation/views/text_inria_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/string_list_converter.dart';
import '../../../data/model/book_model.dart';
import '../../../provider/book_list_provider.dart';
import '../../../provider/current_category_provider.dart';

class LibraryPage extends ConsumerWidget {
  const LibraryPage({Key? key}) : super(key: key);

  static final HiveClient hiveClient = HiveClient();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final files = ref.watch(bookListProvider);

    return Scaffold(
      backgroundColor: colorPrimary.withOpacity(0.4),

      body: SafeArea(
        child: Column(
          children: [
            /// Topbar (Name & Search)
            const TopWidget(),

            /// Category Widget
            Consumer(
              builder: (context, ref, _) {
                final currentCategory = ref.watch(currentCategoryProvider);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: InkWell(
                    onTap: (){
                      CategoryMenu(context, currentCategory);
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                      decoration: BoxDecoration(
                        color: colorAccent.withOpacity(0.04),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),

                      child: Row(
                        children: [
                          TextInriaSans("Category:", size: 16, color: Colors.black38,),

                          const Spacer(),

                          TextInriaSans(
                              currentCategory,
                              size: 16,
                              color: colorAccent,
                              weight: FontWeight.bold,),

                          const SizedBox(width: 10,),

                          const Icon(Icons.arrow_drop_down_rounded, color: Colors.black87,),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),

            const SizedBox(height: 10,),

            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final currentCategory = ref.watch(currentCategoryProvider);

                  return FutureBuilder(
                    future: files,
                    builder: (context, AsyncSnapshot snapshot) {

                      if(snapshot.hasData){

                        List date = snapshot.data;

                        //sort by add date
                        date.sort((a, b) {
                          return b.addDate.compareTo(a.addDate);
                        });

                        return ListView.builder(
                            itemCount: getFilteredList(date, currentCategory).length,

                            itemBuilder: (context, index){
                              return ListItem(book: getFilteredList(date, currentCategory)[index]);
                            }
                        );

                      } else {

                        return const Center(child: CircularProgressIndicator(),);
                      }
                    }
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }


  List getFilteredList(List allBooks, String category) {
    List filteredList = [];

    if(category == "All") {
      filteredList = allBooks;
      return filteredList;
    }

    //Iterate through all books, and filter
    for (BookModel element in allBooks) {
      if (element.category != null) {
        List bookCategories = getListFromString(element.category!);

        // if book has that category
        if(bookCategories.contains(category)) filteredList.add(element);

      }
    }

    return filteredList;
  }
}
