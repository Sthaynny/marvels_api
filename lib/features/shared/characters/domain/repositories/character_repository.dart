import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

abstract interface class CharacterRepository {
  Future<Result<List<CharacterModel>>> getCharacters();
}
