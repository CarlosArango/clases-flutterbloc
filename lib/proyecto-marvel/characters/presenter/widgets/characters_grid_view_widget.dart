import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/_children/detail/detail_page_args.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/bloc/characters_bloc.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/config/router_config.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/character_item_widget.dart';
import 'package:go_router/go_router.dart';

class CharactersGridViewWidget extends StatelessWidget {
  const CharactersGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
              crossAxisCount: 2,
              childAspectRatio: .7,
            ),
            itemCount: state.characters.length,
            padding: const EdgeInsets.only(
              top: 32,
            ),
            itemBuilder: (content, index) {
              final character = state.characters[index];
              return CharacterItemWidget(
                name: character.name,
                image:
                    '${character.thumbnail.path}.${character.thumbnail.extension}',
                comicsNumber: character.comics.available,
                onTap: () {
                  context.goNamed(
                    CharacterRoutes.characterDetail,
                    extra: DetailPageArgs(character: character),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
