import 'entities.dart';

class GameEntity {
  final List<PlayerEntity> players;
  final DeckEntity deck;

  const GameEntity({
    required this.players,
    required this.deck,
  });
}
