import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flip_streak/presentation/views/dialoq/translate_dialog/view/internet_available_view.dart';
import 'package:flip_streak/presentation/views/dialoq/translate_dialog/view/no_internet_view.dart';
import 'package:flip_streak/presentation/views/dialoq/translate_dialog/translate_dialog.dart';
import 'package:flutter/material.dart';

class TranslateView extends StatefulWidget {
  const TranslateView(this.selectedText, {Key? key}) : super(key: key);

  final String? selectedText;

  @override
  State<TranslateView> createState() => _TranslateViewState();
}

class _TranslateViewState extends State<TranslateView> {

  StreamSubscription? internetConnection;
  bool isOffline = true;


  /// Init
  ///                                                                           / Handle Internet State
  @override
  void initState() {
    //Listen to connectivity changes
    internetConnection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {

      if(result == ConnectivityResult.none){
        //No Connection --
        setState(() {
          isOffline = true;
        });
      }else if(result == ConnectivityResult.mobile){
        //Connection: (mobile data)
        setState(() {
          isOffline = false;
        });
      }else if(result == ConnectivityResult.wifi){
        //Connection: (wifi)
        setState(() {
          isOffline = false;
        });
      }
    });

    super.initState();
  }

  /// Build
  @override
  Widget build(BuildContext context) {
    TranslateDialog.textController.text = widget.selectedText ?? "";

    return
      isOffline
        ? const NoInternetView()
        : const InternetAvailableView();
  }

  /// Dispose
  // Be sure to cancel subscription after you are done
  @override
  dispose() {
    if(internetConnection != null) internetConnection!.cancel();
    super.dispose();
  }
}
