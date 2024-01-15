part of 'characters_bloc.dart';

enum CharactersStatus { initial, loading, success, failure }

class CharactersState extends Equatable {
  const CharactersState({
    this.characters = const <CharacterModel>[],
    this.search = '',
    this.status = CharactersStatus.initial,
  });

  final List<CharacterModel> characters;
  final String search;
  final CharactersStatus status;

  const CharactersState.initial() : this();

  CharactersState copyWith({
    List<CharacterModel>? characters,
    String? search,
    CharactersStatus? status,
  }) {
    return CharactersState(
      characters: characters ?? this.characters,
      search: search ?? this.search,
      status: status ?? this.status,
    );
  }

  CharactersState loading() {
    return copyWith(status: CharactersStatus.loading);
  }

  CharactersState success(List<CharacterModel> characters) {
    return copyWith(
      characters: characters,
      status: CharactersStatus.success,
    );
  }

  CharactersState failure() {
    return copyWith(status: CharactersStatus.failure);
  }

  bool get isLoading => status == CharactersStatus.loading;

  bool get isSuccess => status == CharactersStatus.success;

  bool get isFailure => status == CharactersStatus.failure;

  @override
  List<Object> get props => [
        characters,
        search,
        status,
      ];
}
