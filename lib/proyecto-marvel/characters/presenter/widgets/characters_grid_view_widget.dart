import 'package:flutter/material.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/character_item_widget.dart';

class CharactersGridViewWidget extends StatelessWidget {
  const CharactersGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
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
      ),
    );
  }
}
