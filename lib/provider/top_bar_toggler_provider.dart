import 'package:flutter_riverpod/flutter_riverpod.dart';

final topbarTogglerProvider = StateNotifierProvider<TopbarTogglerProvider, int>((ref) {

  return TopbarTogglerProvider();
});


class TopbarTogglerProvider extends StateNotifier<int>{
  TopbarTogglerProvider() : super(0);

  void toggleTopbar(int barIndex,) => state = barIndex;

}