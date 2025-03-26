import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/features/shared/characters/data/repositories/character_repository_imp.dart';
import 'package:marvels_api/features/shared/characters/data/services/character_service.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';
import 'package:mocktail/mocktail.dart';

class CharacterServiceMock extends Mock implements CharacterService {}

void main() {
  final service = CharacterServiceMock();
  final repository = CharacterRepositoryImp(characterService: service);

  group('CharacterRepository', () {
    test('Deve retornar uma lista de CharacterModel', () async {
      when(
        () => service.getCharacters(),
      ).thenAnswer((_) async => Result.ok([]));
      final result = await repository.getCharacters();

      expect(result.isOk, true);
      expect(result.value, isA<List<CharacterModel>>());
    });

    test('Deve retornar um erro', () async {
      when(
        () => service.getCharacters(),
      ).thenAnswer((_) async => Result.error(Exception()));
      final result = await repository.getCharacters();

      expect(result.isError, true);
      expect(result.error, isA<Exception>());
    });
  });
}
