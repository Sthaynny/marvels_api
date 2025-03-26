import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';
import 'package:marvels_api/features/shared/characters/domain/models/thumbnails_model.dart';

final tInstanceCharacterModel = CharacterModel(
  id: 1,
  name: 'Demolidor',
  description:
      'Demolidor é um personagem fictício que aparece nas histórias em quadrinhos publicadas pela Marvel Comics. Um super-herói criado pelo escritor/editor Stan Lee e pelo artista Bill Everett com algumas contribuições de Jack Kirby.',
  thumbnail: ThumbnailsModel(
    path:
        'https://static.wikia.nocookie.net/liberproeliis/images/d/de/Demolidor.png/revision/latest?cb=20190314032551&path-prefix=pt-br',
    ext: 'jpg',
  ),
);
final tMapCharacter = <String, dynamic>{
  'id': 1,
  'name': 'name',
  'description': 'description',
  'thumbnail': tMapThumbnails,
};

final tInstanceThumbnailsModel = ThumbnailsModel(path: 'path', ext: 'ext');
final tMapThumbnails = <String, dynamic>{'path': 'path', 'extension': 'ext'};
