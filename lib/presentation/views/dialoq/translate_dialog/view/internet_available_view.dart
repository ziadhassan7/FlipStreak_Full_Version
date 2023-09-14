import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_constants/color_constants.dart';
import '../../../../../provider/translation_provider.dart';
import '../../../text_inria_sans.dart';
import '../translate_dialog.dart';
import '../widget/language_tool_bar.dart';

class InternetAvailableView extends StatelessWidget {
  const InternetAvailableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [
            // change languages
            const LanguageToolbar(),

            // Space
            alignmentWidget(),

            // normal text
            _sourceTextWidget(),

            // Space
            alignmentWidget(),

            // translated
            _translatedTextWidget(),
          ],
        )
    );
  }

  static _sourceTextWidget(){
    return Theme(
      data: ThemeData(),
      child: TextFormField(

        decoration: InputDecoration(
            fillColor: colorAccent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            )
        ),
        controller: TranslateDialog.textController,
        maxLines: 4,
      ),
    );
  }

  static _translatedTextWidget(){
    return Consumer(
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

                      child: SingleChildScrollView(
                          child: SizedBox(
                            width: 100,
                            child: TextInriaSans(
                              snapshot.data,
                              weight: FontWeight.bold,
                              textDirection: TextDirection.rtl,
                              maxLine: 1000,
                            ),
                          )
                      )
                  ),
                )
                    : const Center(child: CircularProgressIndicator(),);
              }
          );
        });
  }


  alignmentWidget(){
    return const SizedBox(height: 10,);
  }

}
