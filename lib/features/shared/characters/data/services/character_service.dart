import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvels_api/core/api/api.dart';

class CharacterService {
  CharacterService() {
    _dio = Dio(BaseOptions());
  }
  late final Dio _dio;
  Future<Response> getCharacters() async {
    String timestamp = DateTime.now().toIso8601String();
    return await _dio.get(
      'https://gateway.marvel.com/v1/public/characters?apikey=$publicKey&ts=$timestamp&hash=${md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString()}',
    );
  }
}
