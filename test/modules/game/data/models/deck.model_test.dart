import 'package:flutter_blackjack/modules/game/data/models/models.dart';
import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeckModel', () {
    test('should create a DeckModel from JSON', () {
      // Arrange
      final json = {'deck_id': 'test_deck_id', 'remaining': 42};

      // Act
      final deckModel = DeckModel.fromJson(json);

      // Assert
      expect(deckModel, isA<DeckModel>());
      expect(deckModel.deckId, equals(json['deck_id']));
      expect(deckModel.remaining, equals(json['remaining']));
    });

    test('should convert to a DeckEntity', () {
      // Arrange
      final deckModel = DeckModel(deckId: 'test_deck_id', remaining: 42);

      // Act
      final deckEntity = deckModel.toEntity;

      // Assert
      expect(deckEntity, isA<DeckEntity>());
      expect(deckEntity.deckId, equals(deckModel.deckId));
      expect(deckEntity.remaining, equals(deckModel.remaining));
    });
  });
}
