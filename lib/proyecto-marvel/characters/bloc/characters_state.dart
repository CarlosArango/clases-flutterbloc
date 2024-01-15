part of 'characters_bloc.dart';

enum CharactersStatus { initial, loading, successList, successSearch, failure }

class CharactersState extends Equatable {
  const CharactersState({
    this.characters = const <CharacterModel>[],
    this.search = '',
    this.status = CharactersStatus.initial,
    this.charactersSearched = const <CharacterModel>[],
  });

  final List<CharacterModel> characters;
  final List<CharacterModel> charactersSearched;
  final String search;
  final CharactersStatus status;

  const CharactersState.initial() : this();

  CharactersState copyWith({
    List<CharacterModel>? characters,
    String? search,
    CharactersStatus? status,
    List<CharacterModel>? charactersSearched,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      search: search ?? this.search,
      status: status ?? this.status,
      charactersSearched: charactersSearched ?? this.charactersSearched,
    );
  }

  CharactersState loading() {
    return copyWith(status: CharactersStatus.loading);
  }

  CharactersState successList() {
    return copyWith(
      status: CharactersStatus.successList,
    );
  }

  CharactersState successSearch() {
    return copyWith(
      status: CharactersStatus.successSearch,
    );
  }

  CharactersState failure() {
    return copyWith(status: CharactersStatus.failure);
  }

  bool get isLoading => status == CharactersStatus.loading;

  bool get isSuccessList => status == CharactersStatus.successList;
  bool get isSuccessSearch => status == CharactersStatus.successSearch;

  bool get isFailure => status == CharactersStatus.failure;

  @override
  List<Object> get props => [
        characters,
        search,
        status,
        charactersSearched,
      ];
}
