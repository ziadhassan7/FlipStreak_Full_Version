import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flip_streak/business/print_debug.dart';
import 'package:flip_streak/presentation/views/dialoq/translate_dialog/no_internet_view.dart';
import 'package:flip_streak/presentation/views/dialoq/translate_dialog/translate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../provider/translation_provider.dart';
import '../../text_inria_sans.dart';

class TranslateView extends StatefulWidget {
  const TranslateView(this.selectedText, {Key? key}) : super(key: key);

  final String? selectedText;

  @override
  State<TranslateView> createState() => _TranslateViewState();
}

class _TranslateViewState extends State<TranslateView> {

  StreamSubscription? internetConnection;
  bool isOffline = true;

  @override
  void initState() {
    //Listen to connectivity changes
    internetConnection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {

      PrintDebug("contecgifgnd:", result);

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

  @override
  Widget build(BuildContext context) {
    TranslateDialog.textController.text = widget.selectedText ?? "";

    return
      isOffline
        ? const NoInternetView()
        : Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.all(10),

          child: Column(
            children: [
              Theme(

                data: ThemeData(),

                child: TextFormField(

                  decoration: InputDecoration(
                      fillColor: colorAccent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )
                  ),
                  maxLines: 5,
                  controller: TranslateDialog.textController,
                ),
              ),

              const SizedBox(height: 10,),

              Consumer(
                  builder: (context, ref, _) {


                    return FutureBuilder(
                        future: ref.watch(translationProvider),
                        builder: (context, AsyncSnapshot snapshot) {

                          return snapshot.hasData
                            ? Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: colorAccent.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(Radius.circular(25))
                                ),

                                child: Expanded(
                                    child: SingleChildScrollView(
                                      child: TextInriaSans(
                                          snapshot.data,
                                          weight: FontWeight.bold,
                                          textDirection: TextDirection.rtl,
                                      )
                                    )
                                )
                            ),
                          )
                          : const Center(child: CircularProgressIndicator(),);
                        }
                    );
                  }),
            ],
          )
      );
  }

  // Be sure to cancel subscription after you are done
  @override
  dispose() {
    if(internetConnection != null) internetConnection!.cancel();
    super.dispose();
  }
}
