import 'package:flip_streak/app_constants/color_constants.dart';
import 'package:flutter/material.dart';
import '../text_inria_sans.dart';


class DialogWidget {

  final BuildContext context;

  final Color backgroundColor;
  final bool disableTintColor;
  final bool isDisableButtons;

  final String dominantButtonTitle;
  final Color dominantButtonColor;
  final Function()? dominantButtonFunction;

  final bool dominateButtonCloseAfterFunction;

  final Widget child;



  DialogWidget(
      this.context,
      {this.backgroundColor = Colors.white,
        this.disableTintColor = false,

        this.dominantButtonTitle = "Save",
        this.dominantButtonColor = colorAccent,
        this.dominantButtonFunction,
        this.isDisableButtons = false,

        this.dominateButtonCloseAfterFunction = true,

        required this.child,

      }) : assert(isDisableButtons != false || dominantButtonFunction != null,
        'You cannot pass a function, with isDisableButtons as true'
      ); // You can either have (isDisableButtons = true or dominantButtonFunction = object), both cannot violate the assert


  showAlert() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context)
        {
              return AlertDialog(
                surfaceTintColor: disableTintColor ? backgroundColor : null,
                /// Background Color
                backgroundColor: backgroundColor,

                /// Child Content Widget
                content: child,

                actions: isDisableButtons
                    ? null
                    : <Widget>[
                        /// Cancel Button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: TextInriaSans(
                            'Cancel',
                            color: colorDark,
                          ),
                        ),

                        /// Confirm Button
                        TextButton(
                            onPressed: (){
                              dominantButtonFunction!();
                              //close window
                              if(dominateButtonCloseAfterFunction){
                                Navigator.pop(context);
                              }
                            },

                            style: ButtonStyle(
                              //color
                              backgroundColor: MaterialStateProperty.all(
                                  dominantButtonColor),
                            ),
                            //text
                            child: TextInriaSans(
                              dominantButtonTitle,
                              color: backgroundColor,
                            )),
                      ],
              );
            });

  }

}