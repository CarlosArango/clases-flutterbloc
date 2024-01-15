import 'package:flutter_bloc_clases/proyecto-marvel/characters/data/character_model.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/data/characters_provider.dart';

class CharactersRepository {
  CharactersRepository({required this.provider});

  final CharactersProvider provider;

  Future<List<CharacterModel>> getCharactersByLetter(String letter) async {
    return await provider.readByLetter(letter);
  }

  Future<List<CharacterModel>> getCharactersBySearch(String value) async {
    return await provider.readBySearch(value);
  }
}
