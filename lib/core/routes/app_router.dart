import 'package:flutter/widgets.dart';
import 'package:marvels_api/core/dependecy/dependency.dart';
import 'package:marvels_api/features/details/details_character_screen.dart';
import 'package:marvels_api/features/home/view/home_screen.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRouters.home.path: (context) => HomeScreen(viewModel: dependency()),
  AppRouters.detailsPerson.path: (context) {
    return DetailsCharacterScreen(
      character: ModalRoute.of(context)?.settings.arguments as CharacterModel,
    );
  },
};

enum AppRouters {
  home,
  detailsPerson;

  const AppRouters();
  String get path => this == home ? '/' : '/$name';
}
