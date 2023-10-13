import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_blackjack/modules/game/domain/repositories/repositories.dart';
import 'package:flutter_blackjack/modules/game/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<DeckRepository>()])
import '../mocks/deck.repository_test.mocks.dart';

void main() {
  group('StartNewGameUsecase', () {
    late StartNewGameUsecase startNewGameUsecase;
    late MockDeckRepository mockDeckRepository;

    setUp(() {
      mockDeckRepository = MockDeckRepository();
      startNewGameUsecase =
          StartNewGameUsecase(deckRepository: mockDeckRepository);
    });

    test('Successfully start a new game', () async {
      const numberOfPlayers = 3;
      final mockDeck = DeckEntity(
        deckId: 'mockDeckId',
        remaining: 52,
      );

      when(mockDeckRepository.createDeck())
          .thenAnswer((_) => Future.value(mockDeck));

      final newGame =
          await startNewGameUsecase.call(numberOfPlayers: numberOfPlayers);

      expect(newGame.deck, equals(mockDeck));
      expect(newGame.players, hasLength(numberOfPlayers + 1));
      expect(newGame.playing, hasLength(numberOfPlayers + 1));
      expect(newGame.rounds, equals(1));
    });

    test('Error in starting a new game should rethrow the exception', () async {
      const numberOfPlayers = 2;

      when(mockDeckRepository.createDeck())
          .thenThrow(Exception('Failed to create deck'));

      expect(() => startNewGameUsecase.call(numberOfPlayers: numberOfPlayers),
          throwsException);
    });
  });
}
