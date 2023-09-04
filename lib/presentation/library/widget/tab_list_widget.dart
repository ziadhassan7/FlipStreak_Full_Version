import 'package:flutter/material.dart';
import '../../views/text_inria_sans.dart';
import 'list_item.dart';

class TabListWidget extends StatelessWidget {
  const TabListWidget({Key? key, required this.list}) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return (list.isNotEmpty)

    ? ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListItem(book: list[index],);
        })


    : Center(child: TextInriaSans("Nothing here"),);
  }
}
