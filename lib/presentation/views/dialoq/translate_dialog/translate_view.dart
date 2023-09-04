import 'package:flip_streak/presentation/views/dialoq/translate_dialog/translate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_constants/color_constants.dart';
import '../../../../provider/translation_provider.dart';
import '../../text_inria_sans.dart';

class TranslateView extends StatelessWidget {
  const TranslateView(this.selectedText, {Key? key}) : super(key: key);

  final String? selectedText;

  @override
  Widget build(BuildContext context) {
    TranslateDialog.textController.text = selectedText ?? "";

    return Container(
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


/*Future<String> getTranslatedText(context, selectedText) async {
    String translatedText = await TranslateHandler.translate(selectedText);
    return translatedText;
  }*/
}
