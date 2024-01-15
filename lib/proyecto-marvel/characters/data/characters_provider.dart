import 'package:dio/dio.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/data/character_model.dart';

class CharactersProvider {
  Future<List<CharacterModel>> readBySearch(String value) async {
    Dio dio = Dio();
    final response = await dio.get(
      'https://gateway.marvel.com/v1/public/characters',
      queryParameters: {
        'apikey': '27c2c1a97fd983b91fb6145156eee93a',
        'nameStartsWith': value,
        'ts': 1,
        'hash': 'bca10a9f35e3070d13850048503c7851'
      },
    );

    final data = response.data;
    final results = data['data']['results'];

    return List.from(results).map((e) => CharacterModel.fromJson(e)).toList();
  }

  Future<List<CharacterModel>> readByLetter(String letter) async {
    Dio dio = Dio();
    final response = await dio.get(
      'https://gateway.marvel.com/v1/public/characters',
      queryParameters: {
        'apikey': '27c2c1a97fd983b91fb6145156eee93a',
        'nameStartsWith': letter,
        'ts': 1,
        'hash': 'bca10a9f35e3070d13850048503c7851'
      },
    );

    final data = response.data;
    final results = data['data']['results'];

    return List.from(results).map((e) => CharacterModel.fromJson(e)).toList();
  }
}
