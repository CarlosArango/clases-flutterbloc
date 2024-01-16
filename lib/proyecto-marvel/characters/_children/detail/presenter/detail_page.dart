import 'package:flutter/material.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/characters/_children/detail/detail_page_args.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.args});
  final DetailPageArgs args;

  @override
  Widget build(BuildContext context) {
    return _ViewProvided(
      args: args,
    );
  }
}

class _ViewProvided extends StatelessWidget {
  const _ViewProvided({required this.args});
  final DetailPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: _Body(args: args),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.args});
  final DetailPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${args.character.thumbnail.path}.${args.character.thumbnail.extension}',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: 90),
            Text(
              args.character.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontStyle: FontStyle.italic,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w200,
                height: 0,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Comics ${args.character.comics.available.toString()}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFA4A0C),
                fontSize: 22,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              args.character.description,
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
                fontSize: 15,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
