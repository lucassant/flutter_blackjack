import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<PlayerEntity> players = [
    PlayerEntity(
      name: 'Player 1',
      hand: [],
    ),
    PlayerEntity(
      name: 'Player 2',
      hand: [],
    ),
  ];

  final DeckEntity deck = DeckEntity(
    deckId: 'deck_id_test',
    remaining: 52,
  );

  group('GameEntity', () {
    test('should create a valid GameEntity', () {
      final gameEntity = GameEntity(
        players: players,
        deck: deck,
      );

      expect(gameEntity.players, players);
      expect(gameEntity.deck, deck);
      expect(gameEntity.playing, []);
      expect(gameEntity.winners, []);
      expect(gameEntity.losers, []);
      expect(gameEntity.isGameOver, false);
      expect(gameEntity.rounds, 0);
    });

    test('Adding players to playing list', () {
      final gameEntity = GameEntity(players: players, deck: deck);

      gameEntity.playing.addAll(players);
      expect(gameEntity.playing, hasLength(2));
    });

    test('Marking the game as over', () {
      final gameEntity = GameEntity(players: players, deck: deck);

      gameEntity.isGameOver = true;
      expect(gameEntity.isGameOver, isTrue);
    });

    test('Incrementing rounds', () {
      final gameEntity = GameEntity(players: players, deck: deck);

      gameEntity.rounds++;
      expect(gameEntity.rounds, equals(1));
    });
  });
}
