import 'package:marvels_api/core/utils/commands/commands.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';
import 'package:marvels_api/features/shared/characters/domain/models/thumbnails_model.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';

final class HomeViewModel {
  HomeViewModel({required CharacterRepository characterRepository}) {
    getCharacters = CommandBase<List<CharacterModel>>(() async {
      final result = await characterRepository.getCharacters();
      // if (result.isError) {
      //   _isError = true;
      // } else {
      //   _isError = false;
      // _characters = result.value!;
      _characters = List.generate(20, (index) => temporario);
      // }
      return result;
    });
  }

  List<CharacterModel> _characters = [];
  bool _isError = false;

  List<CharacterModel> get characters => _characters;
  bool get isError => _isError;

  late final CommandBase<List<CharacterModel>> getCharacters;
}

final temporario = CharacterModel(
  id: 1,
  name: 'Spiderman',
  description:
      'Demolidor é um personagem fictício que aparece nas histórias em quadrinhos publicadas pela Marvel Comics. Um super-herói criado pelo escritor/editor Stan Lee e pelo artista Bill Everett com algumas contribuições de Jack Kirby.',
  thumbnail: ThumbnailsModel(
    path:
        'https://static.wikia.nocookie.net/liberproeliis/images/d/de/Demolidor.png/revision/latest?cb=20190314032551&path-prefix=pt-br',
    ext: 'jpg',
  ),
);
