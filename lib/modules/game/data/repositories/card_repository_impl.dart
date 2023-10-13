import 'package:flutter_blackjack/core/data/external_connection.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../models/models.dart';

class CardRepositoryImpl extends CardRepository {
  final ExternalConnection networkClient;

  CardRepositoryImpl({
    required this.networkClient,
  });

  @override
  Future<CardEntity> drawCards({
    required String deckId,
    required int count,
  }) async {
    try {
      final endpoint = '/deck/$deckId/draw/?count=$count';

      final response = await networkClient.getRequest(endpoint);

      final result = CardModel.fromJson(response).toEntity;

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
