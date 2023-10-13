import 'package:flutter_blackjack/core/data/external_connection.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../models/models.dart';

class DeckRepositoryImpl extends DeckRepository {
  final ExternalConnection networkClient;

  DeckRepositoryImpl({
    required this.networkClient,
  });

  @override
  Future<DeckEntity> createDeck() async {
    try {
      const endpoint = '/deck/new/shuffle/?deck_count=1';

      final response = await networkClient.getRequest(endpoint);

      final result = DeckModel.fromJson(response).toEntity;

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DeckEntity> shuffleDeck({
    required String deckId,
  }) async {
    try {
      final endpoint = '/deck/$deckId/shuffle/?remaining=true';

      final response = await networkClient.getRequest(endpoint);

      final result = DeckModel.fromJson(response).toEntity;

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
