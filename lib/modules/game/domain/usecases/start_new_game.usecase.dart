import '../entities/entities.dart';
import '../repositories/repositories.dart';

class StartNewGameUsecase {
  final DeckRepository deckRepository;

  StartNewGameUsecase({
    required this.deckRepository,
  });

  Future<GameEntity> call({
    required int numberOfPlayers,
  }) async {
    final players = _createPlayers(
      numberOfPlayers: numberOfPlayers + 1,
    );

    try {
      final deck = await deckRepository.createDeck();

      final result = GameEntity(
        deck: deck,
        players: players,
      );

      result.playing.addAll(players);
      result.rounds++;

      return result;
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
}
