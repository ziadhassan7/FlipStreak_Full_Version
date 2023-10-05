import 'dart:io';
import 'package:flip_streak/presentation/book/screen/book_page.dart';
import 'package:flip_streak/provider/select_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../business/app_wise/counters/counters_helper.dart';
import '../../../provider/page_filter_provider.dart';
import '../../../provider/search_text_provider.dart';
import '../../../provider/main_top_bar_provider.dart';
import '../../views/context_menu/context_menu.dart';
import '../../views/topbar/search_topbar/search_bar.dart';

class PdfViewer extends ConsumerWidget {
  const PdfViewer({Key? key, this.initialPage}) : super(key: key);

  static final CountersHelper counters = CountersHelper();

  static ColorFilter _pageFilter = filterNormalPage;
  final int? initialPage;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final filter = ref.watch(pageFilterProvider);
    ref.watch(searchTextProvider);

    openInitialPage();

    togglePageFilter(filter); //change page color filter


    return ColorFiltered(
      colorFilter: _pageFilter,

      child: SfPdfViewerTheme(
        data: SfPdfViewerThemeData(
          backgroundColor: getBackgroundColor(filter),
        ),

        child: SfPdfViewer.file(
          File(bookModel.path),

          key: BookPage.pdfViewerKey,
          controller: controller,
          scrollDirection: PdfScrollDirection.vertical,
          pageLayoutMode: PdfPageLayoutMode.continuous,


          /// Text Select
          onTextSelectionChanged:
              (PdfTextSelectionChangedDetails details) {

            if (details.selectedText == null && !FindBar.searchResult.hasResult && ContextMenu.current != null) {
              ref.read(selectTextProvider.notifier).deselect();
              //Make sure it's opened
              ref.read(mainTopBarProvider.notifier).keepOpen();

              ContextMenu.current!.remove();
              ContextMenu.current = null;

            } else if (details.selectedText != null && ContextMenu.current == null) {
              //Open selection top-bar
              ref.read(selectTextProvider.notifier).selected();
              //Make sure it's opened
              ref.read(mainTopBarProvider.notifier).keepOpen();
              //Show context menu
              ContextMenu.show(context, ref, details);
            }

          },

          /// Load Doc
          onDocumentLoaded: (details){

            // update BookModel with total pages value
            bookModel = bookModel.copyWith(totalPages: controller.pageCount,);

            updateBookDetails();

            //When book finish loading, open top bar
            Future.delayed(const Duration(milliseconds: 100), (){
              ref.read(mainTopBarProvider.notifier).keepOpen();
            });

          },

        ),
      ),
    );
  }


  void togglePageFilter(int filter){
    switch(filter){
      case 0:
        _pageFilter = filterNormalPage;
        break;
      case 1:
        _pageFilter = filterGreyedLook;
        break;
      case 2:
        _pageFilter = filterEyeCare;
        break;
      case 3:
        _pageFilter = filterDarkPage;
        break;
      default:
        _pageFilter = filterNormalPage;
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



