import 'entities.dart';

class GameEntity {
  final List<PlayerEntity> players;
  final DeckEntity deck;
  List<PlayerEntity> playing = [];
  final List<PlayerEntity> winners = [];
  final List<PlayerEntity> losers = [];
  bool isGameOver = false;
  int rounds = 0;

  GameEntity({
    required this.players,
    required this.deck,
  });
}
