import 'package:flip_streak/business/app_wise/counters/counters_util.dart';
import 'package:flip_streak/business/system_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/last_book_provider.dart';
import '../../provider/main_top_bar_provider.dart';
import 'controllers/book_controller.dart';

class ExitBookHandler {

  static closeBook(WidgetRef ref) {
    //disable status bar color when going back
    SystemUtil.disableStatusBarColor();
    //make sure Top bar is closed before leaving
    ref.read(mainTopBarProvider.notifier).keepClosed();
    // toggle book firstOpen
    CountersUtil.resetFirstOpen();
    // Refresh LastBook Widget provider
    ref.read(lastBookProvider.notifier).updateWidget(bookModel);
  }
}