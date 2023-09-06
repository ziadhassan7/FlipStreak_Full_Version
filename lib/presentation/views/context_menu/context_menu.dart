import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../styles/device_screen.dart';
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
    double deviceWidth = DeviceScreen(context).width;
    double deviceHeight = DeviceScreen(context).height;

    if(_verticalPosition > (deviceHeight-200)) {
      _verticalPosition = _verticalPosition - (200);
    }

    if(_horizontalPosition > (deviceWidth-150)) {
      _horizontalPosition = _horizontalPosition - (150);
    }

    if(_horizontalPosition > (deviceWidth-270)) {
      _horizontalPosition = _horizontalPosition - (200);
    }
  }

}