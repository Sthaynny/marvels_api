import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/home/view/home_screen.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
import 'package:marvels_api/features/home/view/widgets/card_character_widget.dart';
import 'package:marvels_api/features/home/view/widgets/carrousel_characters_widget.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../test/feature/mock/character_mock.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

void main() {
  final repository = CharacterRepositoryMock();
  group('HomeScreen', () {
    patrolTest('Teste de HomeScreen (Sucesso)', ($) async {
      when(() => repository.getCharacters()).thenAnswer(
        (_) async =>
            Result.ok(List.generate(25, (_) => tInstanceCharacterModel)),
      );
      await $.pumpWidgetAndSettle(
        HomeScreen(viewModel: HomeViewModel(characterRepository: repository)),
      );

      await $.pumpAndSettle();

      expect(find.byType(CardCharacterWidget), findsWidgets);
      expect(find.byType(CarrouselCharactersWidget), findsOneWidget);
      expect(find.byType(ImageWidget), findsWidgets);
    });
    patrolTest('Teste de HomeScreen(Erro)', ($) async {
      when(
        () => repository.getCharacters(),
      ).thenAnswer((_) async => Result.errorDefault(''));
      await $.pumpWidgetAndSettle(
        HomeScreen(viewModel: HomeViewModel(characterRepository: repository)),
      );

      await $.pumpAndSettle();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is ElevatedButton &&
              widget.child is Text &&
              (widget.child as Text).data == recarregarString,
        ),
        findsOneWidget,
      );


      
    });
  });
}
