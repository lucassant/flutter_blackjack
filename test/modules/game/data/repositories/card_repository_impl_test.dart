import 'package:flutter_blackjack/core/data/external_connection.dart';
import 'package:flutter_blackjack/modules/game/data/repositories/repositories.dart';
import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExternalConnection>()])
import 'external_connection.mock.dart';

void main() {
  group('CardRepositoryImpl', () {
    late CardRepositoryImpl cardRepository;
    late ExternalConnection networkClient;

    const deckId = 'test_deck_id';
    const count = 5;
    const endpoint = '/deck/$deckId/draw/?count=$count';

    setUp(() {
      networkClient = MockExternalConnection();
      cardRepository = CardRepositoryImpl(networkClient: networkClient);
    });

    test('should draw cards successfully', () async {
      // Arrange
      final Map<String, dynamic> mockResponse = {
        'cards': [
          {
            'image': 'test_image_url_1',
            'value': 'KING',
            'suit': 'SPADES',
          },
          {
            'image': 'test_image_url_2',
            'value': 'QUEEN',
            'suit': 'HEARTS',
          },
        ],
      };

      when(networkClient.getRequest(endpoint))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result =
          await cardRepository.drawCards(deckId: deckId, count: count);

      // Assert
      expect(result, isA<List<CardEntity>>());
      expect(result.length, equals(mockResponse['cards'].length));
      expect(result[0].image, equals('test_image_url_1'));
      expect(result[1].value, equals('QUEEN'));
    });

    test('should rethrow an error if network request fails', () async {
      // Arrange
      when(networkClient.getRequest(endpoint))
          .thenThrow(Exception('Network error'));

      // Act and Assert
      expect(() => cardRepository.drawCards(deckId: deckId, count: count),
          throwsException);
    });
  });
}
