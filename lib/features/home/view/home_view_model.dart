import 'package:marvels_api/core/utils/commands/commands.dart';
import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';

final class HomeViewModel {
  HomeViewModel({required CharacterRepository characterRepository}) {
    getCharacters = CommandBase<List<CharacterModel>>(() async {
      final result = await characterRepository.getCharacters();
      if (result.isError) {
        _isError = true;
      } else {
        _isError = false;
        _characters = result.value!;
      }
      return result;
    });
  }

  List<CharacterModel> _characters = [];
  bool _isError = false;

  List<CharacterModel> get characters => _characters;
  bool get isError => _isError;

  late final CommandBase<List<CharacterModel>> getCharacters;
}
