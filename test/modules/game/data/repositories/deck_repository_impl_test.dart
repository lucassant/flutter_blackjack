import 'package:flutter_blackjack/core/data/external_connection.dart';
import 'package:flutter_blackjack/modules/game/data/repositories/repositories.dart';
import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExternalConnection>()])
import 'external_connection.mock.dart';

void main() {
  group('DeckRepositoryImpl', () {
    late DeckRepositoryImpl deckRepository;
    late ExternalConnection networkClient;

    const deckId = 'test_deck_id';

    const createDeckEndpoint = '/deck/new/shuffle/?deck_count=1';
    const shuffleDeckEndpoint = '/deck/test_deck_id/shuffle/?remaining=true';

    setUp(() {
      networkClient = MockExternalConnection();
      deckRepository = DeckRepositoryImpl(networkClient: networkClient);
    });

    test('should create a new deck successfully', () async {
      // Arrange
      final mockResponse = {
        'deck_id': 'test_deck_id',
        'remaining': 42,
      };

      when(networkClient.getRequest(createDeckEndpoint))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await deckRepository.createDeck();

      // Assert
      expect(result, isA<DeckEntity>());
      expect(result.deckId, equals('test_deck_id'));
      expect(result.remaining, equals(42));
    });

    test('should shuffle a deck successfully', () async {
      // Arrange

      final mockResponse = {
        'deck_id': 'test_deck_id',
        'remaining': 42,
      };

      when(networkClient.getRequest(shuffleDeckEndpoint))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await deckRepository.shuffleDeck(deckId: deckId);

      // Assert
      expect(result, isA<DeckEntity>());
      expect(result.deckId, equals('test_deck_id'));
      expect(result.remaining, equals(42));
    });

    test('should rethrow an error if network request fails during createDeck',
        () async {
      // Arrange
      when(networkClient.getRequest(createDeckEndpoint))
          .thenThrow(Exception('Network error'));

      // Act and Assert
      expect(() => deckRepository.createDeck(), throwsException);
    });

    test('should rethrow an error if network request fails during shuffleDeck',
        () async {
      // Arrange
      when(networkClient.getRequest(shuffleDeckEndpoint))
          .thenThrow(Exception('Network error'));

      // Act and Assert
      expect(() => deckRepository.shuffleDeck(deckId: 'test_deck_id'),
          throwsException);
    });
  });
}
