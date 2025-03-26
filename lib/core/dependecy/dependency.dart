import 'package:get_it/get_it.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
import 'package:marvels_api/features/shared/characters/data/repositories/character_repository_imp.dart';
import 'package:marvels_api/features/shared/characters/data/services/character_service.dart';
import 'package:marvels_api/features/shared/characters/domain/repositories/character_repository.dart';

final dependency = GetIt.instance;

void setupDependency() {
  dependency.registerFactory(CharacterService.new);
  dependency.registerFactory<CharacterRepository>(
    () => CharacterRepositoryImp(characterService: dependency()),
  );
  dependency.registerFactory(
    () => HomeViewModel(characterRepository: dependency()),
  );
}
