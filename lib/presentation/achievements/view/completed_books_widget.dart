import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../../../app_constants/color_constants.dart';
import '../../../data/model/book_model.dart';
import '../../styles/box_decoration.dart';
import '../../styles/padding.dart';
import '../../views/text_inria_sans.dart';
import '../widget/completed_book_item.dart';

class CompletedBooksWidget extends StatelessWidget {
  const CompletedBooksWidget({Key? key, required  this.books}) : super(key: key);

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(hor: 30, ver: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const CustomPadding(hor: 12),
            child: TextInriaSans("Completed Books", size: 20,),
          ),

          alignmentWidget(),

          Container(
            padding: const CustomPadding.only(horizontal: 20, bottom: 100),

            decoration: CustomDecoration(
                backgroundColor: Colors.white, //colorBackground
                radius: 30,
                borderWidth: 2,
                borderColor: colorAccent.withOpacity(0.4)
            ),

            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: books.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3.2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 15),

              itemBuilder: (BuildContext context, int index) {
                String name = basename(books[index].id); //removes .pdf
                return CompletedBookItem(
                    bookName: name,
                    bookModel: books[index]
                );
              },
            )
          ),
        ],
      ),
    );
  }

  Widget alignmentWidget(){
    return const SizedBox(height: 16,);
  }
}
