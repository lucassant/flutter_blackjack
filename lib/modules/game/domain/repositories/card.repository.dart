import '../entities/entities.dart';

abstract class CardRepository {
  Future<List<CardEntity>> drawCards({
    required String deckId,
    required int count,
  });
}
