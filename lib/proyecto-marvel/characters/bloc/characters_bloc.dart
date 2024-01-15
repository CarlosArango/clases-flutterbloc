import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/data/character_model.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/data/characters_repository.dart';
import 'package:stream_transform/stream_transform.dart';
part 'characters_event.dart';
part 'characters_state.dart';

EventTransformer<Event> debounce<Event>({
  Duration duration = const Duration(milliseconds: 1000),
}) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({required this.charactersRepository})
      : super(const CharactersState.initial()) {
    on<CharactersStarted>(_onCharactersStarted);
    on<CharactersTabChanged>(_onCharactersTabChanged);
    on<CharactersSearchChanged>(
      _onCharactersSearchChanged,
      transformer: debounce(),
    );
  }

  final CharactersRepository charactersRepository;

  void _onCharactersStarted(
    CharactersStarted event,
    Emitter<CharactersState> emit,
  ) async {
    emit(state.loading());
    print('CharactersBloc._onCharactersStarted');
    final response = await charactersRepository.getCharactersByLetter('a');
    emit(
      state.copyWith(
        status: CharactersStatus.success,
        characters: response,
      ),
    );
  }

  void _onCharactersTabChanged(
    CharactersTabChanged event,
    Emitter<CharactersState> emit,
  ) async {
    emit(state.loading());

    final response =
        await charactersRepository.getCharactersByLetter(event.value);
    emit(
      state.copyWith(
        status: CharactersStatus.success,
        characters: response,
      ),
    );
  }

  void _onCharactersSearchChanged(
    CharactersSearchChanged event,
    Emitter<CharactersState> emit,
  ) {
    emit(state.loading());
    emit(
      state.copyWith(
        search: event.search,
        status: CharactersStatus.success,
      ),
    );
  }
}
