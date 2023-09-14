import 'package:flip_streak/business/app_wise/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../provider/book_list_provider.dart';
import '../../../../provider/last_book_provider.dart';
import '../picker_dialog/picker_dialog.dart';


class EditLastPageDialog {

  final BuildContext context;
  final WidgetRef ref;

  EditLastPageDialog( this.context, this.ref,) {

    PickerDialog(
        context,
        title: "Edit Last Page",

        initialValue: bookModel.lastPage,
        maxValue: bookModel.totalPages,

        onSave: (value){
          ref.read(bookListProvider.notifier).editLastPage(value);
          // Also change it in the last book widget
          ref.read(lastBookProvider.notifier).updateLastPage(bookModel, value);
        });
  }

}