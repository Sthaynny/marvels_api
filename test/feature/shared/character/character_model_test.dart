import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

import '../../mock/character_mock.dart';

void main() {
  test('Deve retornar uma instancia de CharacterModel', () {
    expect(tInstanceCharacterModel, isA<CharacterModel>());
  });

  test('Deve retornar um modelo valido(Map)', () {
    final result = CharacterModel.fromMap(tMapCharacter);

    expect(result, isA<CharacterModel>());
  });

  test('Deve retornar um Map', () {
    final result = tInstanceCharacterModel.toMap();

    expect(result, tMapCharacter);
  });
}
