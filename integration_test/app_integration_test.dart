import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/core/dependecy/dependency.dart';
import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
import 'package:marvels_api/features/home/view/widgets/card_character_widget.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';
import 'package:marvels_api/main.dart' as app;
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../test/feature/mock/character_mock.dart';
import 'utils/waits_fuctions.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

void main() {
  final repository = CharacterRepositoryMock();
  group('App', () {
    patrolWidgetTest('App', ($) async {
      setupDependency(repository);
      app.mainMock();

      when(() => repository.getCharacters()).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 3));
        return Result.error(Exception());
      });

      await waitFor(
        $.tester,
        find.byWidgetPredicate(
          (widget) =>
              widget is ElevatedButton &&
              widget.child is Text &&
              (widget.child as Text).data == recarregarString,
        ),
      );

      await Future.delayed(Duration(seconds: 3));

      await $.pumpAndSettle();

      final buttonReload = find.byWidgetPredicate(
        (widget) =>
            widget is ElevatedButton &&
            widget.child is Text &&
            (widget.child as Text).data == recarregarString,
      );

      when(() => repository.getCharacters()).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 3));
        return Result.ok(
          List.generate(
            25,
            (index) => tInstanceCharacterModel.copyWith(id: index),
          ),
        );
      });

      await $(buttonReload).tap();

      await waitFor(
        $.tester,
        find.byWidgetPredicate((widget) => widget is CardCharacterWidget),
      );

      await Future.delayed(Duration(seconds: 3));

      await $.pumpAndSettle();

      final card = find.byKey(Key('card-14'));

      await $.scrollUntilVisible(finder: card);

      await $.pumpAndSettle();

      await $(card).tap();

      await $.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == detalhesPersonagemString,
        ),
        findsOneWidget,
      );

      await Future.delayed(Duration(seconds: 3));
      final voltarButton = find.byWidgetPredicate(
        (widget) =>
            widget is ElevatedButton &&
            widget.child is Text &&
            (widget.child as Text).data == voltarString,
      );

      await $.scrollUntilVisible(finder: voltarButton);
      await $(voltarButton).tap();

      await $.pumpAndSettle();
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == nomeAppString,
        ),
        findsOneWidget,
      );
      await Future.delayed(Duration(seconds: 3));
    });
  });
}

void setupDependency(CharacterRepositoryMock repo) {
  dependency.registerSingleton<CharacterRepository>(repo);
  dependency.registerFactory(
    () => HomeViewModel(characterRepository: dependency()),
  );
}
