import '../entities/entities.dart';
import '../repositories/repositories.dart';

class ShuffleDeckUsecase {
  final DeckRepository repository;

  ShuffleDeckUsecase({
    required this.repository,
  });

  Future<DeckEntity> call({
    required String deckId,
  }) async {
    try {
      final result = await repository.shuffleDeck(deckId: deckId);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
