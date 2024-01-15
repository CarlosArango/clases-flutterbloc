import 'package:flutter/material.dart' hide RouterConfig;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/bloc/characters_bloc.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/presenter/widgets/characters_grid_view_widget.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/presenter/widgets/search_widget.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/presenter/widgets/tabs_widget.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/loader.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharactersBloc>(
      create: (context) => context.read<CharactersBloc>()
        ..add(
          CharactersStarted(),
        ),
      child: const _ViewProvided(),
    );
  }
}

class _ViewProvided extends StatelessWidget {
  const _ViewProvided();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharactersBloc, CharactersState>(
      listener: (context, state) {
        print("listener ${state.status}");
        if (state.status == CharactersStatus.loading) {
          Loader.show(context);
        } else if (state.status == CharactersStatus.successList) {
          Loader.hide(context);
        }
      },
      listenWhen: (previous, current) => previous.status != current.status,
      child: const Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ).copyWith(
        top: 100,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personajes \ndel mundo de Marvel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 31,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 28),
          SearchWidget(),
          SizedBox(height: 50),
          TabsWidget(),
          CharactersGridViewWidget(),
        ],
      ),
    );
  }
}
