import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeckEntity', () {
    test('should create a DeckEntity', () {
      // Arrange
      const deckId = 'test_deck_id';
      const remaining = 42;

      // Act
      const deckEntity = DeckEntity(deckId: deckId, remaining: remaining);

      // Assert
      expect(deckEntity, isA<DeckEntity>());
      expect(deckEntity.deckId, equals(deckId));
      expect(deckEntity.remaining, equals(remaining));
    });
  });
}
