import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/details/details_character_screen.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';
import 'package:patrol/patrol.dart';

import '../../test/feature/mock/character_mock.dart';

void main() {
  group('HomeScreen', () {
    patrolTest('Teste de DetailsCharacterScreen (Sucesso)', ($) async {
      await $.pumpWidgetAndSettle(
        DetailsCharacterScreen(character: tInstanceCharacterModel),
      );

      await $.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) => widget is Text && widget.data == detalhesPersonagemString,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text && widget.data == tInstanceCharacterModel.name,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Text &&
              widget.data == tInstanceCharacterModel.description,
        ),
        findsOneWidget,
      );
      expect(find.byType(ImageWidget), findsOneWidget);
    });
  });
}

void validationsDetailsCharacterScreen(PatrolIntegrationTester $) {}
