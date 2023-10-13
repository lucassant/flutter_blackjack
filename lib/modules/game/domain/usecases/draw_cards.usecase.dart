import '../entities/entities.dart';
import '../repositories/repositories.dart';

class DrawCardsUsecase {
  final CardRepository repository;

  DrawCardsUsecase({
    required this.repository,
  });

  Future<List<PlayerEntity>> call({
    required String deckId,
    required List<PlayerEntity> players,
  }) async {
    try {
      final List<PlayerEntity> playersWithNewCards = players;

      final cards = await repository.drawCards(
        deckId: deckId,
        count: players.length,
      );

      for (int i = 0; i < players.length; i++) {
        playersWithNewCards[i].hand.add(cards[i]);
      }

      return playersWithNewCards;
    } catch (e) {
      rethrow;
    }
  }
}
