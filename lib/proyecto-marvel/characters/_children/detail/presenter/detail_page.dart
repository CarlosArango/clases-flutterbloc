import 'package:flutter/material.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/_children/detail/detail_page_args.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.args});
  final DetailPageArgs args;

  @override
  Widget build(BuildContext context) {
    return const _ViewProvided();
  }
}

class _ViewProvided extends StatelessWidget {
  const _ViewProvided();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
