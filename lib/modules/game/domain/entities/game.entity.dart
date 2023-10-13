import 'entities.dart';

class GameEntity {
  final List<PlayerEntity> players;
  final DeckEntity deck;
  final List<PlayerEntity> winners = [];

  GameEntity({
    required this.players,
    required this.deck,
  });
}
