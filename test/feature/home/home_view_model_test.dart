import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';
import 'package:mocktail/mocktail.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

void main() {
  final repository = CharacterRepositoryMock();

  final viewModel = HomeViewModel(characterRepository: repository);

  group('HomeViewModel', () {
    test('Deve retornar uma lista de CharacterModel', () async {
      viewModel.getCharacters.clearResult();
      when(
        () => repository.getCharacters(),
      ).thenAnswer((_) async => Result.ok([]));

      expect(viewModel.getCharacters.completed, false);

      expect(viewModel.isError, false);

      await viewModel.getCharacters.execute();

      expect(viewModel.isError, false);
      expect(viewModel.getCharacters.completed, true);
      expect(viewModel.getCharacters.result?.isOk, true);
    });

    test('Deve retornar um erro', () async {
      viewModel.getCharacters.clearResult();
      when(
        () => repository.getCharacters(),
      ).thenAnswer((_) async => Result.error(Exception()));

      expect(viewModel.getCharacters.error, false);

      expect(viewModel.isError, false);

      await viewModel.getCharacters.execute();

      expect(viewModel.isError, true);
      expect(viewModel.getCharacters.result?.isError, true);
      viewModel.getCharacters.clearResult();
    });
  });
}
