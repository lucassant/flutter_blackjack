import '../entities/entities.dart';

abstract class DeckRepository {
  Future<DeckEntity> createDeck();
  Future<DeckEntity> shuffleDeck({
    required String deckId,
  });
}
