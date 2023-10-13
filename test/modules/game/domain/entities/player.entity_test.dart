import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlayerEntity', () {
    test('should create a PlayerEntity', () {
      // Arrange
      const name = 'Player 1';

      final hand = <CardEntity>[
        const CardEntity(image: 'image1', value: 'KING', suit: 'SPADES'),
        const CardEntity(image: 'image2', value: 'ACE', suit: 'HEARTS'),
      ];

      // Act
      final playerEntity = PlayerEntity(name: name, hand: hand);

      // Assert
      expect(playerEntity, isA<PlayerEntity>());
      expect(playerEntity.name, equals(name));
      expect(playerEntity.hand, equals(hand));
    });

    test('should calculate the score correctly', () {
      // Arrange
      final hand = <CardEntity>[
        const CardEntity(image: 'image1', value: 'KING', suit: 'SPADES'),
        const CardEntity(image: 'image2', value: 'ACE', suit: 'HEARTS'),
        const CardEntity(image: 'image3', value: '7', suit: 'DIAMONDS'),
      ];

      final playerEntity = PlayerEntity(name: 'Dealer', hand: hand);

      // Act
      final score = playerEntity.getScore;

      // Assert
      expect(score, equals(18));
    });
  });
}
