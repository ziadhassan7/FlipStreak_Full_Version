import 'package:flip_streak/provider/select_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../business/app_wise/controllers/book_controller.dart';
import '../../../provider/main_top_bar_provider.dart';

class ScreenTouchDetector extends StatelessWidget {
  const ScreenTouchDetector({Key? key, required this.widgetRef}) : super(key: key);

  final WidgetRef widgetRef;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: () {
        if(widgetRef.watch(selectTextProvider)){
          controller.clearSelection();
        } else {
          widgetRef.read(mainTopBarProvider.notifier).toggle();
        }

      },

      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
