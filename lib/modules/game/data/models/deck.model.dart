import '../../domain/entities/entities.dart';

class DeckModel {
  final String deckId;
  final int remaining;

  DeckModel({
    required this.deckId,
    required this.remaining,
  });

  factory DeckModel.fromJson(Map<String, dynamic> json) {
    return DeckModel(
      deckId: json['deck_id'],
      remaining: json['remaining'],
    );
  }

  DeckEntity get toEntity {
    return DeckEntity(
      deckId: deckId,
      remaining: remaining,
    );
  }
}
