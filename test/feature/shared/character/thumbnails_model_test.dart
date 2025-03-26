import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/features/shared/characters/domain/models/thumbnails_model.dart';

import '../../mock/character_mock.dart';

void main() {
  test('Deve retornar uma instancia de ThumbnailsModel', () {
    expect(tInstanceThumbnailsModel, isA<ThumbnailsModel>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = ThumbnailsModel.fromMap(tMapThumbnails);

    expect(result, isA<ThumbnailsModel>());
  });
  test('Deve retornar um Map', () {
    final result = tInstanceThumbnailsModel.toMap();

    expect(result, tMapThumbnails);
  });
}
