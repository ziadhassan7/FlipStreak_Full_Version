import 'package:flip_streak/app_constants/topbar_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../provider/page_selection_provider.dart';
import '../../../provider/search_text_provider.dart';


class FindBar extends ConsumerWidget {
  const FindBar({Key? key, required this.foregroundColor, required this.backgroundColor,}) : super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;

  static PdfTextSearchResult searchResult = PdfTextSearchResult();

  static final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return WillPopScope(

        onWillPop: () async {
          ref.read(pageSelectionProvider.notifier).toggleTopbar(TOPBAR_MAIN);
          FindBar.searchResult.clear();
          //When you finish searching, go back to the page you were in
          controller.jumpToPage(bookModel.lastPage);
          return false;
        },

        child: Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor,


          child: Row(
            children: [
              iconButton(
                  icon: Icons.close,
                  onPressed: () {
                    ref.read(pageSelectionProvider.notifier).toggleTopbar(TOPBAR_MAIN);
                    FindBar.searchResult.clear();
                    //When you finish searching, go back to the page you were in
                    controller.jumpToPage(bookModel.lastPage);
                  }
              ),


              const Spacer(),

              SizedBox(
                  width: MediaQuery.of(context).size.width /2,
                  child: Theme(
                    data: ThemeData(),

                    child: TextFormField(
                      style: TextStyle(color: foregroundColor),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: foregroundColor),
                        ),
                      ),
                      cursorColor: foregroundColor,
                      controller: textController,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (value) {
                        String text = value.trim(); //remove whitespaces

                        FindBar.searchResult = controller.searchText(text,
                          /*searchOption: TextSearchOption.caseSensitive*/);

                        FindBar.searchResult.addListener(() {
                          if (FindBar.searchResult.hasResult) {
                            ref.read(searchTextProvider.notifier)
                                .searchIndex(FindBar.searchResult.currentInstanceIndex);
                          }
                        });
                      },
                    ),
                  )),

              iconButton(
                icon: Icons.arrow_back_ios,
                onPressed: FindBar.searchResult.hasResult ?
                null : ()=> FindBar.searchResult.previousInstance(),
              ),

              iconButton(
                icon: Icons.arrow_forward_ios,
                onPressed: FindBar.searchResult.hasResult ?
                null : ()=> FindBar.searchResult.nextInstance(),
              ),
            ],
          ),
        )
    );
  }

  Widget iconButton ({required IconData icon, required Function()? onPressed}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: onPressed,

        icon: Icon(icon, size: 17),
        color: foregroundColor,),
    );
  }
}
