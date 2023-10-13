import 'package:get_it/get_it.dart';

import 'game/game.module.dart';

class AppModule {
  final getIt = GetIt.instance;

  void initModules() {
    final modules = [
      GameModule(),
    ];

    for (var module in modules) {
      module.setup();
    }
  }
}
