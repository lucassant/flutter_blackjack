import '../entities/entities.dart';
import '../repositories/repositories.dart';

class CreateDeckUsecase {
  final DeckRepository repository;

  CreateDeckUsecase({
    required this.repository,
  });

  Future<DeckEntity> call() async {
    try {
      final result = await repository.createDeck();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
