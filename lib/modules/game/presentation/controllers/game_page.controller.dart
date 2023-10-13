import 'dart:developer';

import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

class GamePageController extends ChangeNotifier {
  final CreateDeckUsecase createDeckUsecase;
  final DrawCardsUsecase drawCardsUsecase;
  final ShuffleDeckUsecase shuffleDeckUsecase;

  GamePageController({
    required this.createDeckUsecase,
    required this.drawCardsUsecase,
    required this.shuffleDeckUsecase,
  });

  GameEntity? gameEntity;
  bool isPageLoading = false;

  Future<void> initGame({
    required numberOfPlayers,
  }) async {
    _setPageLoading(true);

    await _initializeGameEntity(
      numberOfPlayers: numberOfPlayers,
    );

    await _drawCards();

    _setPageLoading(false);
  }

  Future<void> newTurn() async {
    if (gameEntity == null) {
      assert(false, 'GameEntity is null');
    }

    try {
      _setPageLoading(true);

      await _drawCards();

      log('O jogo acabou? ${_checkIfGameIsOver()}');

      _setPageLoading(false);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> shuffleRemainingCards() async {
    if (gameEntity == null) {
      assert(false, 'GameEntity is null');
    }

    try {
      _setPageLoading(true);

      await shuffleDeckUsecase(
        deckId: gameEntity!.deck.deckId,
      );

      _setPageLoading(false);
    } catch (e) {
      rethrow;
    }
  }

  void _setPageLoading(bool value) {
    isPageLoading = value;
    notifyListeners();
  }

  bool _checkIfGameIsOver() {
    bool isGameOver = false;

    if (gameEntity == null) {
      assert(false, 'GameEntity is null');
    }

    final dealer = gameEntity!.players[0];
    final dealerScore = dealer.getScore;

    log('Dealer tem $dealerScore pontos');

    if (dealerScore == 21) {
      isGameOver = true;
      gameEntity!.winners.add(dealer);
    } else if (dealerScore > 21) {
      isGameOver = true;
      gameEntity!.winners.addAll(gameEntity!.players.where((player) {
        return player.getScore <= 21;
      }));
    }

    if (isGameOver) {
      return isGameOver;
    }

    for (int i = 1; i < gameEntity!.players.length; i++) {
      final player = gameEntity!.players[i];
      final playerScore = player.getScore;

      log('${player.name} tem $playerScore pontos');

      if (playerScore == 21) {
        log('${player.name} ganhou com 21 pontos!');
        isGameOver = true;
      } else if (playerScore > 21) {
        log('${player.name} perdeu');
        isGameOver = true;
      }
    }

    return isGameOver;
  }

  Future<List<CardEntity>> _drawCards() async {
    final cards = await drawCardsUsecase(
      deckId: gameEntity!.deck.deckId,
      numberOfCards: gameEntity!.players.length,
    );

    gameEntity!.deck.remaining -= cards.length;

    _addCardsToPlayersHands(cards);

    return cards;
  }

  void _addCardsToPlayersHands(List<CardEntity> cards) {
    for (int i = 0; i < gameEntity!.players.length; i++) {
      gameEntity!.players[i].hand.add(cards[i]);
    }
  }

  Future<void> _initializeGameEntity({
    required int numberOfPlayers,
  }) async {
    final players = _createPlayers(
      numberOfPlayers: numberOfPlayers + 1,
    );

    try {
      final deck = await createDeckUsecase();

      gameEntity = GameEntity(
        deck: deck,
        players: players,
      );
    } catch (e) {
      rethrow;
    }
  }

  List<PlayerEntity> _createPlayers({
    required int numberOfPlayers,
  }) {
    final List<PlayerEntity> players = [];

    for (int i = 0; i < numberOfPlayers; i++) {
      if (i == 0) {
        players.add(
          PlayerEntity(
            name: 'Dealer',
            hand: [],
          ),
        );
      } else {
        players.add(
          PlayerEntity(
            name: 'Player $i',
            hand: [],
          ),
        );
      }
    }

    return players;
  }

  @override
  void dispose() {
    gameEntity = null;
    _setPageLoading(false);
    super.dispose();
  }
}
