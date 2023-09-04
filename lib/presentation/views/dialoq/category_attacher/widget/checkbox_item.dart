import 'package:flip_streak/data/model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../app_constants/color_constants.dart';
import '../../../text_inria_sans.dart';
import '../category_attacher_dialog.dart';

class CheckboxItem extends StatefulWidget {
  const CheckboxItem({Key? key, required this.catTitle, required this.currentBook}) : super(key: key);

  final String catTitle;
  final BookModel currentBook;

  @override
  State<CheckboxItem> createState() => _CheckboxItemState();
}

class _CheckboxItemState extends State<CheckboxItem> {
  static bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder(
            future: CategoryAttacherDialog.getBookCategories(widget.currentBook),
            builder: (context, AsyncSnapshot snapshot) {


              if (snapshot.hasData){
                //list all manu categories
                List categories = snapshot.data!;
                //check if book has this label
                isChecked = categories.contains(widget.catTitle);
                //show checkbox with current status
                return customCheckbox();

              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            }
        ),

        TextInriaSans(widget.catTitle)
      ],
    );
  }

  Widget customCheckbox(){

    //Inside a dialog, checkboxes do not work correctly
    //You need to wrap them in a statefulBuilder
    return StatefulBuilder(
      builder: (context, setState) {

        return Checkbox(
            activeColor: colorAccent,
            value: isChecked,
            onChanged: (newValue){

              setState((){
                isChecked = newValue!; //using newValue caused problems
              });

              newValue!
                  ? CategoryAttacherDialog.currentCategories.add(widget.catTitle)
                  : CategoryAttacherDialog.currentCategories.remove(widget.catTitle);
            }
        );
      }
    );
  }

}
