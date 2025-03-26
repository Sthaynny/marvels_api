import 'package:flutter_test/flutter_test.dart';
import 'package:marvels_api/features/details/details_character_screen.dart';
import 'package:marvels_api/features/home/view/widgets/card_character_widget.dart';
import 'package:marvels_api/features/home/view/widgets/carrousel_characters_widget.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:patrol/patrol.dart';

import '../../test/feature/mock/character_mock.dart';


void main() {
  group('HomeScreen', () {
    patrolTest('Teste de DetailsCharacterScreen (Sucesso)', ($) async {
      await $.pumpWidgetAndSettle(
        DetailsCharacterScreen(character: tInstanceCharacterModel),
      );

      await $.pumpAndSettle();

      expect(find.byType(CardCharacterWidget), findsWidgets);
      expect(find.byType(CarrouselCharactersWidget), findsOneWidget);
      expect(find.byType(ImageWidget), findsWidgets);
    });
  });
}
