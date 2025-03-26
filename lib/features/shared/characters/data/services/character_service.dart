import 'package:dio/dio.dart';
import 'package:marvels_api/core/api/api.dart';

class CharacterService {
  CharacterService() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
  late final Dio _dio;
  final _baseUrl = 'http://gateway.marvel.com/v1/public';

  Future<Response> getCharacters() async {
    return await _dio.get(
      '/characters',
      options: Options(headers: {"apikey": apiKey}),
    );
  }
}
