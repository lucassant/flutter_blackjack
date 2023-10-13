import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';

class CheckGameStatusUsecase {
  GameEntity call({
    required GameEntity game,
  }) {
    _handleDealerHand(
      game: game,
    );

    if (game.isGameOver) {
      return game;
    }

    _handlePlayersHand(
      game: game,
    );

    _allPlayersHaveLost(game: game);

    _isGameOver(game: game);

    return game;
  }

  GameEntity _handleDealerHand({
    required GameEntity game,
  }) {
    final PlayerEntity dealer = _getDealer(game: game);

    if (_hasDealerWon(dealer: dealer)) {
      game.winners.add(dealer);
      game.playing.remove(dealer);

      _removeLastHandFromPlayers(game: game);

      game.losers.addAll(game.playing);

      game.playing.clear();
      game.isGameOver = true;
    }

    if (_hasDealerLost(dealer: dealer)) {
      game.losers.add(dealer);
      game.playing.remove(dealer);

      _removeLastHandFromPlayers(game: game);

      game.winners.addAll(game.playing);

      game.playing.clear();
      game.isGameOver = true;
    }

    return game;
  }

  GameEntity _handlePlayersHand({
    required GameEntity game,
  }) {
    for (int i = 1; i < game.players.length; i++) {
      final player = game.players[i];

      if (!game.losers.contains(player)) {
        if (player.getScore == 21) {
          game.winners.add(player);
          game.playing.remove(player);
        } else if (player.getScore > 21) {
          game.losers.add(player);
          game.playing.remove(player);
        }
      }
    }

    return game;
  }

  GameEntity _isGameOver({
    required GameEntity game,
  }) {
    if (game.winners.isNotEmpty) {
      game.losers.addAll(game.playing);
      game.playing.clear();
      game.isGameOver = true;
    }

    return game;
  }

  GameEntity _allPlayersHaveLost({
    required GameEntity game,
  }) {
    if (game.playing.length == 1 && game.winners.isEmpty) {
      game.winners.add(game.playing[0]);
      game.playing.clear();
    }
    return game;
  }

  bool _hasDealerWon({
    required PlayerEntity dealer,
  }) {
    return dealer.getScore == 21;
  }

  bool _hasDealerLost({
    required PlayerEntity dealer,
  }) {
    return dealer.getScore > 21;
  }

  PlayerEntity _getDealer({
    required GameEntity game,
  }) {
    return game.players[0];
  }

  GameEntity _removeLastHandFromPlayers({
    required GameEntity game,
  }) {
    for (int i = 0; i < game.playing.length; i++) {
      game.playing[i].hand.removeLast();
    }

    return game;
  }
}
