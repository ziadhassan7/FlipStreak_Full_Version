import 'dart:io';
import 'package:flip_streak/app_constants/topbar_constants.dart';
import 'package:flip_streak/presentation/book/screen/book_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../business/app_wise/counters/counters_util.dart';
import '../../../business/app_wise/controllers/page_controller.dart';
import '../../../provider/page_filter_provider.dart';
import '../../../provider/page_selection_provider.dart';
import '../../../provider/search_text_provider.dart';
import '../../../provider/top_bar_provider.dart';
import '../../views/topbar/search_bar.dart';

class PdfViewer extends ConsumerWidget {
  PdfViewer({Key? key, this.initialPage}) : super(key: key);

  ColorFilter pageFilter = filterNormalPage;
  final int? initialPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final filter = ref.watch(pageFilterProvider);
    ref.watch(searchTextProvider);

    openInitialPage();

    togglePageFilter(filter); //change page color filter


    return ColorFiltered(
      colorFilter: pageFilter,

      child: SfPdfViewerTheme(
        data: SfPdfViewerThemeData(
          backgroundColor: getBackgroundColor(filter),
        ),

        child: Consumer(
          builder: (context, ref, child) {
            return Stack(
              children: [
                SfPdfViewer.file(
                  File(bookModel.path),

                  key: BookPage.pdfViewerKey,
                  controller: controller,
                  scrollDirection: PdfScrollDirection.horizontal,
                  pageLayoutMode: PdfPageLayoutMode.single,


                  /// Text Select
                  onTextSelectionChanged:
                      (PdfTextSelectionChangedDetails details) {

                    if (details.selectedText == null && !FindBar.searchResult.hasResult) {
                      ref.read(pageSelectionProvider.notifier).toggleTopbar(TOPBAR_MAIN);
                      //Make sure it's opened
                      Future.delayed(const Duration(milliseconds: 100), (){
                        ref.read(topBarProvider.notifier).keepOpen();
                      });

                    } else if (details.selectedText != null ) {
                      //Open selection top-bar
                      ref.read(pageSelectionProvider.notifier)
                          .toggleTopbar(TOPBAR_SELECT,);
                      //Make sure it's opened
                      ref.read(topBarProvider.notifier).keepOpen();
                      //to access selected text
                      globalSelectedText = details.selectedText;
                    }

                  },

                  /// Load Doc
                  onDocumentLoaded: (details){

                    // update BookModel with total pages value
                    bookModel = bookModel.copyWith(totalPages: controller.pageCount,);

                    updateBookDetails();

                    //When book finish loading, open top bar
                    Future.delayed(const Duration(milliseconds: 100), (){
                      ref.read(topBarProvider.notifier).keepOpen();
                    });

                  },

                  /// Change Page
                  onPageChanged: (details) async {
                    int lastPage = await getLastPage(bookModel.id);
                    int newPage = details.newPageNumber;

                    if (newPage > lastPage) {
                      CountersUtil.updateCounters(ref, isIncrement: true);
                      checkFab(ref);

                    } else {
                      CountersUtil.updateCounters(ref, isIncrement: false);
                      checkFab(ref);
                    }

                    if(newPage == bookModel.totalPages) {
                      markAsComplete();
                    }
                  },
                ),
              ],
            );
          }
        ),
      ),
    );
  }


  void togglePageFilter(int filter){
    switch(filter){
      case 0:
        pageFilter = filterNormalPage;
        break;
      case 1:
        pageFilter = filterGreyedLook;
        break;
      case 2:
        pageFilter = filterEyeCare;
        break;
      case 3:
        pageFilter = filterDarkPage;
        break;
      default:
        pageFilter = filterNormalPage;
    }
  }


  Color? getBackgroundColor(int filter){
    if (filter == 0){
      return const Color.fromRGBO(241, 241, 241, 0.9686274509803922);

    }
    if (filter == 1){
      return const Color.fromRGBO(236, 236, 236, 0.5);

    }
    if (filter == 2) {
      return const Color.fromRGBO(40, 36, 36, 1.0);

    }
    if (filter == 3){
      return const Color.fromRGBO(255,255,255, 0.95);

    }  else {
      return null;
    }
  }

  void openInitialPage () {
    //If you are not searching (cuz, when searching, pdf page gets rebuilt)
    if(!FindBar.searchResult.hasResult){

      //If there is an initial page specified, open it.
      //if not, open last page user have been on.
      initialPage != null
          ? controller.jumpToPage(initialPage!)
          : jumpToLastPage(bookModel.id);
    }
  }

}



