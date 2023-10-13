import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_blackjack/modules/game/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CheckGameStatusUsecase', () {
    final DeckEntity deck = DeckEntity(
      deckId: 'deck_id',
      remaining: 50,
    );

    const CardEntity card1 = CardEntity(
      image: 'image_test',
      value: '6',
      suit: 'SPADES',
    );

    const CardEntity card2 = CardEntity(
      image: 'image_test',
      value: '2',
      suit: 'HEARTS',
    );

    const CardEntity card3 = CardEntity(
      image: 'image_test',
      value: 'KING',
      suit: 'SPADES',
    );

    const CardEntity card4 = CardEntity(
      image: 'image_test',
      value: 'ACE',
      suit: 'SPADES',
    );

    const CardEntity card5 = CardEntity(
      image: 'image_test',
      value: 'QUEEN',
      suit: 'SPADES',
    );

    late CheckGameStatusUsecase checkGameStatusUsecase;

    setUp(() {
      checkGameStatusUsecase = CheckGameStatusUsecase();
    });

    test('Dealer wins and game ends', () {
      final dealer = PlayerEntity(
        name: 'Dealer',
        hand: [
          card3,
          card4,
          card5,
        ],
      );

      final player1 = PlayerEntity(
        name: 'Player1',
        hand: [
          card1,
          card2,
        ],
      );

      final game = GameEntity(
        deck: deck,
        players: [dealer, player1],
      );

      game.playing = [dealer, player1];

      final updatedGame = checkGameStatusUsecase.call(game: game);

      expect(updatedGame.isGameOver, isTrue);
      expect(updatedGame.winners, contains(dealer));
      expect(updatedGame.losers, contains(player1));
      expect(updatedGame.playing, isEmpty);
    });

    test('Dealer loses and game ends', () {
      final dealer = PlayerEntity(
        name: 'Dealer',
        hand: [],
      );

      final player1 = PlayerEntity(
        name: 'Player1',
        hand: [
          card1,
          card2,
        ],
      );

      final game = GameEntity(
        deck: deck,
        players: [dealer, player1],
      );

      game.playing = [dealer, player1];

      dealer.hand = [card1, card2, card3, card5];

      final updatedGame = checkGameStatusUsecase.call(game: game);

      expect(updatedGame.isGameOver, isTrue);
      expect(updatedGame.losers, contains(dealer));
      expect(updatedGame.winners, contains(player1));
      expect(updatedGame.playing, isEmpty);
    });

    test('Player wins with 21 points', () {
      final dealer = PlayerEntity(name: 'Dealer', hand: [
        card1,
        card2,
      ]);

      final player1 = PlayerEntity(name: 'Player1', hand: [
        card3,
        card4,
        card5,
      ]);

      final game = GameEntity(
        deck: deck,
        players: [dealer, player1],
      );

      game.playing = [dealer, player1];

      final updatedGame = checkGameStatusUsecase.call(game: game);

      expect(updatedGame.isGameOver, isTrue);
      expect(updatedGame.winners, contains(player1));
      expect(updatedGame.playing, isEmpty);
      expect(updatedGame.losers, contains(dealer));
    });

    test('Player loses with over 21 points', () {
      final dealer = PlayerEntity(name: 'Dealer', hand: [
        card1,
        card2,
      ]);

      final player1 = PlayerEntity(name: 'Player1', hand: [
        card1,
        card2,
        card3,
        card4,
        card5,
      ]);

      final game = GameEntity(
        players: [dealer, player1],
        deck: deck,
      );

      game.playing = [dealer, player1];

      final updatedGame = checkGameStatusUsecase.call(game: game);

      expect(updatedGame.isGameOver, isTrue);
      expect(updatedGame.losers, contains(player1));
      expect(updatedGame.playing, isEmpty);
      expect(updatedGame.winners, contains(dealer));
    });
  });
}
