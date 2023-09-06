import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'context_menu_view.dart';

class ContextMenu{

  static OverlayEntry? current;
  static late double _verticalPosition;
  static late double _horizontalPosition;

  static void show(BuildContext context,PdfTextSelectionChangedDetails details) {
    final OverlayState overlayState = Overlay.of(context);

    // set position to variables
    _setPosition(context, details);

    // widget
    current = OverlayEntry(
      builder: (context) => Positioned(
        top: _verticalPosition,
        left: _horizontalPosition,

        child: ContextMenuView(
          selectedText: details.selectedText!,),
      ),
    );
    overlayState.insert(current!);
  }


  static _setPosition(context, details){
    _verticalPosition = details.globalSelectedRegion!.center.dy - 80;
    _horizontalPosition = details.globalSelectedRegion!.bottomLeft.dx;

    // At the top of screen,
    // position is under text
    if(_verticalPosition < 10) {
      _verticalPosition = _verticalPosition + (100);
    }

    // Break point is position 125
    if(_horizontalPosition > 125) {
      _horizontalPosition = 125;
    }

  }

}