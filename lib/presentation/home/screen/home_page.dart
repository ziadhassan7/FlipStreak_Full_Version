import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flip_streak/presentation/views/last_book_widget.dart';
import 'package:flip_streak/presentation/home/widget/streak_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../provider/book_list_provider.dart';
import '../../views/text_inria_sans.dart';
import '../widget/add_widget/add_widget.dart';
import '../widget/book_list_view.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final PdfViewerController controller = PdfViewerController();
  final GlobalKey<SfPdfViewerState> scrollerKey =GlobalKey();


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final files = ref.watch(bookListProvider);

    return Scaffold(
      backgroundColor: colorPrimary,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Top Section
              const SizedBox(
                height: 350,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    /// Streak
                    Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: StreakWidget()),

                    /// Add Button
                    AddWidget(),
                  ],
                ),
              ),

              /// Last Book
              const LastBookWidget(),

              /// List - Book List
              FutureBuilder(
                  future: files,
                  builder: (context, AsyncSnapshot snapshot) {

                    if(snapshot.hasData) {
                      List data = snapshot.data;

                      if(data.isEmpty){
                        return Container(
                            padding: const EdgeInsets.only(top: 150),
                            alignment: AlignmentDirectional.bottomCenter,
                            child: TextInriaSans("Start  Adding  New  Books :)",
                              weight: FontWeight.bold, color: Colors.brown.shade400, size: 16,));

                      } else {

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:20, horizontal: 34),
                              child: TextInriaSans("Recently Added", size: 18, weight: FontWeight.bold,),
                            ),

                            BookListView(files: data),
                          ],
                        );
                      }

                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  }
              ),
            ],
          ),
        )
      ),
    );
  }

}