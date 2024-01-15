import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/bloc/characters_bloc.dart';

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

  final Bloc<CharactersEvent, CharactersState> charactersBloc;

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
    charactersBloc.add(
      CharactersSearchChanged(query),
    );
    return BlocBuilder(
      bloc: charactersBloc,
      builder: (context, state) {
        print(state);
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    charactersBloc.add(
      CharactersSearchChanged(query),
    );
    return Container();
  }
}
