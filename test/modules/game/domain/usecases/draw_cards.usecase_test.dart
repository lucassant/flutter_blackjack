import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';
import 'package:flutter_blackjack/modules/game/domain/repositories/repositories.dart';
import 'package:flutter_blackjack/modules/game/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CardRepository>()])
import '../mocks/card.repository_test.mocks.dart';

void main() {
  final List<PlayerEntity> players = [
    PlayerEntity(
      name: 'Player 1',
      hand: [],
    ),
    PlayerEntity(
      name: 'Player 2',
      hand: [],
    ),
  ];

  group('DrawCardsUsecase', () {
    late DrawCardsUsecase drawCardsUsecase;
    late MockCardRepository mockCardRepository;

    setUp(() {
      mockCardRepository = MockCardRepository();
      drawCardsUsecase = DrawCardsUsecase(repository: mockCardRepository);
    });

    test('Successfully draw cards for players', () async {
      const deckId = 'mockDeckId';

      final mockDrawnCards = [
        const CardEntity(
          image: 'image_test',
          value: '6',
          suit: 'SPADES',
        ),
        const CardEntity(
          image: 'image_test',
          value: '7',
          suit: 'HEARTS',
        ),
      ];

      when(mockCardRepository.drawCards(deckId: deckId, count: players.length))
          .thenAnswer((_) => Future.value(mockDrawnCards));

      final updatedPlayers =
          await drawCardsUsecase.call(deckId: deckId, players: players);

      for (int i = 0; i < players.length; i++) {
        expect(updatedPlayers[i].hand, contains(mockDrawnCards[i]));
      }
    });

    test('Error in drawing cards should rethrow the exception', () async {
      const deckId = 'mockDeckId';

      when(mockCardRepository.drawCards(deckId: deckId, count: players.length))
          .thenThrow(Exception('Failed to draw cards'));

      expect(() => drawCardsUsecase.call(deckId: deckId, players: players),
          throwsException);
    });
  });
}
