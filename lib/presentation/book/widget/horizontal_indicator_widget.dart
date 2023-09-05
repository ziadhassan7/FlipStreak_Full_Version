import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../provider/horizontal_indicator_provider.dart';

class HorizontalIndicatorWidget extends ConsumerWidget {
  const HorizontalIndicatorWidget({Key? key,}) : super(key: key);

  static bool shouldBeVisible = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final horizontalIndicatorVisibility = ref.watch(horizontalIndicatorProvider);

    return Visibility(
      visible: horizontalIndicatorVisibility,
      child: Center(
          child: SvgPicture.asset("assets/illustrations/horizontal_scroll_ill.svg")
      )
    );
  }
}
