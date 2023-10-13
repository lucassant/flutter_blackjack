import '../entities/entities.dart';
import '../repositories/repositories.dart';

class DrawCardsUsecase {
  final CardRepository repository;

  DrawCardsUsecase({
    required this.repository,
  });

  Future<List<CardEntity>> call({
    required String deckId,
    required int numberOfCards,
  }) async {
    try {
      final result = await repository.drawCards(
        deckId: deckId,
        count: numberOfCards,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
