import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_constants/color_constants.dart';
import '../../../business/controllers/book_controller.dart';
import '../../../provider/book_list_provider.dart';
import '../../views/text_inria_sans.dart';

class PageNumber extends StatelessWidget {
  const PageNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        textWidget("Page.", isBig: true),

        Row(
          children: [
            Consumer(
              builder: (context, ref, _) {

                ref.watch(bookListProvider);

                return textWidget("${bookModel.lastPage}", isBig: true);
              }
            ),
            textWidget("/${bookModel.totalPages}", isBig: false),
          ],
        ),
      ],
    );
  }

  Widget textWidget(String text, {required bool isBig}) {
    return TextInriaSans(
        text,
        weight: isBig ? FontWeight.bold : FontWeight.normal,
        size: isBig ? 25 : 17,
        color: colorAccent);
  }
}
