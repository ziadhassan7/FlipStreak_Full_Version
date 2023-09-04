import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../provider/welcome_screen_provider.dart';
import '../../views/text_inria_sans.dart';

class PreviousButton extends ConsumerWidget {
  const PreviousButton(this. currentPage, {Key? key}) : super(key: key);

  final Pages currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed:
      (currentPage != Pages.firstPage)
          ? ()=> previousButtonPressed(context, ref, currentPage)
          : null,

      child: TextInriaSans(
        "Previous",
        color: (currentPage != Pages.firstPage) ? Colors.black54 : Colors.black26,
        weight: FontWeight.bold,
        size: 18,
      ),
    );
  }

  /// Previous
  previousButtonPressed(BuildContext context, WidgetRef ref, Pages currentPage){

    List pages = Pages.values;

    if(currentPage != Pages.firstPage){
      ref.read(welcomeScreenProvider.notifier).changeIndex(pages[currentPage.index -1]);
    }
  }

}
