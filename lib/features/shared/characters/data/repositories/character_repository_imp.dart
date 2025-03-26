import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/features/shared/characters/data/services/character_service.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImp implements CharacterRepository {
  final CharacterService _characterService;

  CharacterRepositoryImp({required CharacterService characterService})
    : _characterService = characterService;
  @override
  Future<Result<List<CharacterModel>>> getCharacters() async {
    try {
      final result = await _characterService.getCharacters();

      final data = result.data['data'] as List;
      return Result.ok(
        List.generate(
          data.length,
          (index) => CharacterModel.fromMap(data[index]),
        ),
      );
    } catch (e) {
      return Result.error(e as Exception);
    }
  }
}
