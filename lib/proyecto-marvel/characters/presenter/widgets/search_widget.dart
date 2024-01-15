import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/bloc/characters_bloc.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/character_item_widget.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/loader.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: ShapeDecoration(
        color: const Color(0xFFEFEEEE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: TextField(
        onTap: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(
              charactersBloc: BlocProvider.of<CharactersBloc>(context),
            ),
          );
        },
        decoration: const InputDecoration(
          hintText: 'Buscar',
          hintStyle: TextStyle(
            fontSize: 17,
            color: Color(0xFF99999D),
          ),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontStyle: FontStyle.italic,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w200,
          ),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 15,
              start: 40,
              end: 16,
            ),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 33,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
            top: 18,
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate({
    super.searchFieldLabel,
    super.searchFieldStyle,
    super.searchFieldDecorationTheme,
    super.keyboardType,
    super.textInputAction,
    required this.charactersBloc,
  });

  final CharactersBloc charactersBloc;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) return Container();
    charactersBloc.add(
      const CharactersSearchSubmitted(),
    );
    return BlocConsumer<CharactersBloc, CharactersState>(
      listener: (context, state) {
        if (state.status == CharactersStatus.searching) {
          Loader.show(context);
        } else if (state.status == CharactersStatus.successSearch) {
          Loader.hide(context);
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      bloc: charactersBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
              crossAxisCount: 2,
              childAspectRatio: .7,
            ),
            itemCount: state.charactersSearched.length,
            padding: const EdgeInsets.only(
              top: 32,
            ),
            itemBuilder: (content, index) {
              final character = state.charactersSearched[index];
              return CharacterItemWidget(
                  name: character.name,
                  image:
                      '${character.thumbnail.path}.${character.thumbnail.extension}');
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    charactersBloc.add(
      CharactersSearchChanged(query),
    );
    return BlocBuilder<CharactersBloc, CharactersState>(
      bloc: charactersBloc,
      builder: (context, state) {
        if (state.status == CharactersStatus.searching) {
          return const LoaderWidget();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
              crossAxisCount: 2,
              childAspectRatio: .7,
            ),
            itemCount: state.charactersSearched.length,
            padding: const EdgeInsets.only(
              top: 32,
            ),
            itemBuilder: (content, index) {
              final character = state.charactersSearched[index];
              return CharacterItemWidget(
                  name: character.name,
                  image:
                      '${character.thumbnail.path}.${character.thumbnail.extension}');
            },
          ),
        );
      },
    );
  }
}
