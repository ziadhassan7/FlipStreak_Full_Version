import 'package:flip_streak/business/app_wise/controllers/page_controller.dart';
import 'package:flip_streak/business/system_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/last_book_provider.dart';
import '../../provider/top_bar_provider.dart';
import 'controllers/book_controller.dart';

class ExitBookHandler {

  static closeBook(WidgetRef ref) {
    //disable status bar color when going back
    SystemUtil.disableStatusBarColor();
    //make sure Top bar is closed before leaving
    ref.read(topBarProvider.notifier).keepClosed();
    // update last page
    updateLastPage(pageNumber: controller.pageNumber);
    // Refresh LastBook Widget provider
    ref.read(lastBookProvider.notifier).updateWidget(bookModel);
  }
}