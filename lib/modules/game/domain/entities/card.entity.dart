class CardEntity {
  final String image;
  final String value;
  final String suit;

  const CardEntity({
    required this.image,
    required this.value,
    required this.suit,
  });

  int numericValue() {
    final cardValues = {
      "KING": 10,
      "QUEEN": 10,
      "JACK": 10,
      "ACE": 11,
    };

    return cardValues[value] ?? int.tryParse(value) ?? 0;
  }
}
