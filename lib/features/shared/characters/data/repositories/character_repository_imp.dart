import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/features/shared/characters/data/services/character_service.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImp implements CharacterRepository {
  final CharacterService _characterService;

  CharacterRepositoryImp({required CharacterService characterService})
    : _characterService = characterService;
  @override
  Future<Result<List<CharacterModel>>> getCharacters() {
    // TODO: implement getCharacters
    throw UnimplementedError();
  }
}
