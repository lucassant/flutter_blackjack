import '../entities/entities.dart';

abstract class CardRepository {
  Future<CardEntity> drawCards({
    required String deckId,
    required int count,
  });
}
