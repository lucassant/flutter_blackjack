import '../../domain/entities/entities.dart';

class CardModel {
  final String image;
  final String value;
  final String suit;

  CardModel({
    required this.image,
    required this.value,
    required this.suit,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      image: json['image'],
      value: json['value'],
      suit: json['suit'],
    );
  }

  CardEntity get toEntity {
    return CardEntity(
      image: image,
      value: value,
      suit: suit,
    );
  }
}
