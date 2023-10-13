import 'package:flutter_blackjack/modules/game/data/models/models.dart';
import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CardModel', () {
    test('should create a CardModel from JSON', () {
      // Arrange
      final json = {
        'image': 'test_image_url',
        'value': 'KING',
        'suit': 'SPADES'
      };

      // Act
      final cardModel = CardModel.fromJson(json);

      // Assert
      expect(cardModel, isA<CardModel>());
      expect(cardModel.image, equals(json['image']));
      expect(cardModel.value, equals(json['value']));
      expect(cardModel.suit, equals(json['suit']));
    });

    test('should convert to a CardEntity', () {
      // Arrange
      final cardModel =
          CardModel(image: 'test_image_url', value: 'KING', suit: 'SPADES');

      // Act
      final cardEntity = cardModel.toEntity;

      // Assert
      expect(cardEntity, isA<CardEntity>());
      expect(cardEntity.image, equals(cardModel.image));
      expect(cardEntity.value, equals(cardModel.value));
      expect(cardEntity.suit, equals(cardModel.suit));
    });
  });
}
