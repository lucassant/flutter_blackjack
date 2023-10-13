import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_blackjack/modules/game/domain/repositories/repositories.dart';
import 'package:flutter_blackjack/modules/game/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<DeckRepository>()])
import '../mocks/deck.repository_test.mocks.dart';

void main() {
  group('ShuffleDeckUsecase', () {
    late ShuffleDeckUsecase shuffleDeckUsecase;
    late MockDeckRepository mockDeckRepository;

    setUp(() {
      mockDeckRepository = MockDeckRepository();
      shuffleDeckUsecase = ShuffleDeckUsecase(repository: mockDeckRepository);
    });

    test('Successfully shuffle deck', () async {
      const deckId = 'mockDeckId';
      final mockShuffledDeck = DeckEntity(
        deckId: deckId,
        remaining: 50,
      );

      when(mockDeckRepository.shuffleDeck(deckId: deckId))
          .thenAnswer((_) => Future.value(mockShuffledDeck));

      final shuffledDeck = await shuffleDeckUsecase.call(deckId: deckId);

      expect(shuffledDeck.deckId, deckId);
      expect(shuffledDeck.remaining, 50);
    });

    test('Error in shuffling deck should rethrow the exception', () async {
      const deckId = 'mockDeckId';

      when(mockDeckRepository.shuffleDeck(deckId: deckId))
          .thenThrow(Exception('Failed to shuffle deck'));

      expect(() => shuffleDeckUsecase.call(deckId: deckId), throwsException);
    });
  });
}
