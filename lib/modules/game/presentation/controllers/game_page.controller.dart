import 'package:flutter/material.dart';
import 'package:flutter_blackjack/modules/game/domain/enums/game_status.enum.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

class GamePageController extends ChangeNotifier {
  final CheckGameStatusUsecase checkGameStatusUsecase;
  final StartNewGameUsecase startNewGameUsecase;
  final DrawCardsUsecase drawCardsUsecase;
  final ShuffleDeckUsecase shuffleDeckUsecase;

  GamePageController({
    required this.checkGameStatusUsecase,
    required this.startNewGameUsecase,
    required this.drawCardsUsecase,
    required this.shuffleDeckUsecase,
  });

  GameEntity? gameEntity;
  GameStatus gameStatus = GameStatus.loading;

  Future<void> initGame({
    required numberOfPlayers,
  }) async {
    _setPageLoading(GameStatus.loading);

    gameEntity = await startNewGameUsecase(
      numberOfPlayers: numberOfPlayers,
    );

    await _drawCards();

    _setPageLoading(GameStatus.playing);
  }

  Future<void> newTurn() async {
    if (gameEntity == null) {
      assert(false, 'GameEntity is null');
    }

    try {
      _setPageLoading(GameStatus.loading);

      await _drawCards();

      if (_checkIfGameIsOver()) {
        _setPageLoading(GameStatus.finished);
        return;
      }

      _setPageLoading(GameStatus.playing);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> shuffleRemainingCards() async {
    if (gameEntity == null) {
      assert(false, 'GameEntity is null');
    }

    try {
      _setPageLoading(GameStatus.loading);

      await shuffleDeckUsecase(
        deckId: gameEntity!.deck.deckId,
      );

      _setPageLoading(GameStatus.playing);
    } catch (e) {
      rethrow;
    }
  }

  void _setPageLoading(GameStatus value) {
    gameStatus = value;
    notifyListeners();
  }

  bool _checkIfGameIsOver() {
    if (gameEntity == null) {
      assert(false, 'GameEntity is null');
    }

    gameEntity!.rounds++;

    checkGameStatusUsecase(game: gameEntity!);

    return gameEntity!.isGameOver;
  }

  Future<void> _drawCards() async {
    final playersWithCards = await drawCardsUsecase(
      deckId: gameEntity!.deck.deckId,
      players: gameEntity!.playing,
    );

    gameEntity!.deck.remaining -= playersWithCards.length;

    gameEntity!.playing = playersWithCards;
  }

  @override
  void dispose() {
    gameEntity = null;
    _setPageLoading(GameStatus.loading);
    super.dispose();
  }
}
