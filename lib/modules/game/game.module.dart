import 'dart:developer';

import 'package:flutter_blackjack/modules/game/presentation/controllers/game_page.controller.dart';
import 'package:get_it/get_it.dart';

import '../../core/data/dio_connection_impl.dart';
import '../../core/data/external_connection.dart';
import 'data/repositories/repositories.dart';
import 'domain/repositories/repositories.dart';
import 'domain/usecases/usecases.dart';

class GameModule {
  final ExternalConnection networkClient = DioConnectionImpl();
  final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton<DeckRepository>(
      () => DeckRepositoryImpl(
        networkClient: networkClient,
      ),
    );

    getIt.registerLazySingleton<CardRepository>(
      () => CardRepositoryImpl(
        networkClient: networkClient,
      ),
    );

    getIt.registerFactory<CreateDeckUsecase>(
      () => CreateDeckUsecase(
        repository: getIt<DeckRepository>(),
      ),
    );

    getIt.registerFactory<DrawCardsUsecase>(
      () => DrawCardsUsecase(
        repository: getIt<CardRepository>(),
      ),
    );

    getIt.registerFactory<ShuffleDeckUsecase>(
      () => ShuffleDeckUsecase(
        repository: getIt<DeckRepository>(),
      ),
    );

    getIt.registerFactory<GamePageController>(
      () => GamePageController(
        createDeckUsecase: getIt<CreateDeckUsecase>(),
        drawCardsUsecase: getIt<DrawCardsUsecase>(),
        shuffleDeckUsecase: getIt<ShuffleDeckUsecase>(),
      ),
    );

    log('Game module loaded');
  }
}
