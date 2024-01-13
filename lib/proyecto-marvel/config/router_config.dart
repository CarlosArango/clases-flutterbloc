import 'package:flutter_bloc_clases/proyecto-marvel/characters/presenter/characters_page.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/marvel_home.dart';
import 'package:go_router/go_router.dart';

class RouterConfig {
  static const String home = '/';

  static GoRouter get router {
    return GoRouter(
      routes: [
        GoRoute(
          path: home,
          builder: (context, state) => const MarvelHome(),
        ),
        GoRoute(
          path: CharacterRoutes.mainPage,
          builder: (context, state) => const CharactersPage(),
          routes: [],
        ),
      ],
    );
  }
}

class CharacterRoutes {
  static const String mainPage = '/characters';
  static const String characterDetail = '/characters/:id';
}
