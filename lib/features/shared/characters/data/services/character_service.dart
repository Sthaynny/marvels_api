import 'package:dio/dio.dart';
import 'package:marvels_api/core/api/api.dart';
import 'package:marvels_api/core/utils/result/result.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

class CharacterService {
  CharacterService() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
  late final Dio _dio;
  final _baseUrl = 'http://gateway.marvel.com/v1/public';

  Future<Result<List<CharacterModel>>> getCharacters() async {
    try {
      final result = await _dio.get(
        '/characters',
        options: Options(headers: {"apikey": apiKey}),
      );

      final data = result.data['data'] as List;

      return Result.ok(
        List.generate(
          data.length,
          (index) => CharacterModel.fromMap(data[index]),
        ),
      );
    } catch (e) {
      return Result.error(e as Exception);
    }
  }
}
