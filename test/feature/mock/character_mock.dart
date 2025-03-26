import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';
import 'package:marvels_api/features/shared/characters/domain/models/thumbnails_model.dart';

final tInstanceCharacterModel = CharacterModel(
  id: 1,
  name: 'name',
  description: 'description',
  thumbnail: tInstanceThumbnailsModel,
);
final tMapCharacter = <String, dynamic>{
  'id': 1,
  'name': 'name',
  'description': 'description',
  'thumbnail': tMapThumbnails,
};

final tInstanceThumbnailsModel = ThumbnailsModel(path: 'path', ext: 'ext');
final tMapThumbnails = <String, dynamic>{'path': 'path', 'extension': 'ext'};
