import 'package:flip_streak/business/system_util.dart';
import 'package:flip_streak/provider/book_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock/wakelock.dart';
import '../../provider/last_book_provider.dart';
import '../../provider/main_top_bar_provider.dart';
import 'controllers/book_controller.dart';

class ExitBookHandler {

  static closeBook(WidgetRef ref) {
    //disable status bar color when going back
    SystemUtil.disableStatusBarColor();
    //Screen can dim out now
    Wakelock.disable();
    //make sure Top bar is closed before leaving
    ref.read(mainTopBarProvider.notifier).keepClosed();
    //update last (read date) on book
    ref.read(bookListProvider.notifier).updateLastTimeRead();
    // Refresh LastBook Widget provider
    ref.read(lastBookProvider.notifier).updateWidget(bookModel);
  }
}