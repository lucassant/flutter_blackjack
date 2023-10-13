import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CardEntity', () {
    test('should create a CardEntity', () {
      // Arrange
      const image = 'test_image_url';
      const value = 'KING';
      const suit = 'SPADES';

      // Act
      const cardEntity = CardEntity(image: image, value: value, suit: suit);

      // Assert
      expect(cardEntity, isA<CardEntity>());
      expect(cardEntity.image, equals(image));
      expect(cardEntity.value, equals(value));
      expect(cardEntity.suit, equals(suit));
    });

    test('should return the correct numeric value for value "KING"', () {
      // Arrange
      const cardEntity =
          CardEntity(image: 'test_image_url', value: 'KING', suit: 'SPADES');

      // Act
      final numericValue = cardEntity.numericValue();

      // Assert
      expect(numericValue, equals(10));
    });

    test('should return the correct numeric value for value "ACE"', () {
      // Arrange
      const cardEntity =
          CardEntity(image: 'test_image_url', value: 'ACE', suit: 'SPADES');

      // Act
      final numericValue = cardEntity.numericValue();

      // Assert
      expect(numericValue, equals(11));
    });

    test('should return the correct numeric value for a number card', () {
      // Arrange
      const cardEntity =
          CardEntity(image: 'test_image_url', value: '7', suit: 'SPADES');

      // Act
      final numericValue = cardEntity.numericValue();

      // Assert
      expect(numericValue, equals(7));
    });

    test('should return 0 for an unknown card value', () {
      // Arrange
      const cardEntity =
          CardEntity(image: 'test_image_url', value: 'UNKNOWN', suit: 'SPADES');

      // Act
      final numericValue = cardEntity.numericValue();

      // Assert
      expect(numericValue, equals(0));
    });
  });
}
