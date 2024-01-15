part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class CharactersStarted extends CharactersEvent {}

class CharactersTabChanged extends CharactersEvent {
  const CharactersTabChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class CharactersSearchChanged extends CharactersEvent {
  const CharactersSearchChanged(this.search);

  final String search;

  @override
  List<Object> get props => [search];
}
