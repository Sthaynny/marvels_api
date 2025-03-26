import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/core/dependecy/dependency.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';
import 'package:marvels_api/main.dart' as app;
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

void main() {
  group('App', () {
    patrolWidgetTest('App', ($) async {
      app.mainMock();
    });
  });
}

void setupDependency() {
  dependency.registerFactory<CharacterRepository>(
    () => CharacterRepositoryMock(),
  );
  dependency.registerFactory(
    () => HomeViewModel(characterRepository: dependency()),
  );
}
