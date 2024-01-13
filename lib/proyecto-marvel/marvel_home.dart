import 'package:flutter/material.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/config/router_config.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/character_item_widget.dart';

import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/texts.dart';
import 'package:go_router/go_router.dart';

class MarvelHome extends StatelessWidget {
  const MarvelHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFFF4B3A),
        appBar: AppBar(
          foregroundColor: const Color(0xFFFF4B3A),
          backgroundColor: const Color(0xFFFF4B3A),
          surfaceTintColor: const Color(0xFFFF4B3A),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/marvel_logo.jpeg',
              ),
              const SizedBox(height: 70),
              const Text(
                'Universo de Heros y Villanos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  height: .9,
                  letterSpacing: -1.80,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.go(CharacterRoutes.mainPage);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 60),
                      ),
                    ),
                    child: const TextMedium(
                      'Iniciar',
                      color: Color(0xFFFF460A),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridViewCharacters extends StatelessWidget {
  const GridViewCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 32,
        crossAxisSpacing: 32,
        crossAxisCount: 2,
        childAspectRatio: .7,
      ),
      itemCount: 3,
      padding: const EdgeInsets.only(
        top: 32,
      ),
      itemBuilder: (content, index) {
        return const CharacterItemWidget();
      },
    );
  }
}
