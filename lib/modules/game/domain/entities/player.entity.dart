import 'card.entity.dart';

class PlayerEntity {
  final String name;
  final List<CardEntity> hand;

  PlayerEntity({
    required this.name,
    required this.hand,
  });

  int get getScore {
    final baseScore = calculateBaseScore();
    final acesQuantity = countAces();

    return adjustScoreForAces(baseScore, acesQuantity);
  }

  int calculateBaseScore() {
    return hand.fold(0, (score, card) => score + card.numericValue());
  }

  int countAces() {
    return hand.where((card) => card.value == 'ACE').length;
  }

  int adjustScoreForAces(int baseScore, int acesQuantity) {
    while (acesQuantity > 0 && baseScore > 21) {
      baseScore -= 10;
      acesQuantity--;
    }
    return baseScore;
  }
}
