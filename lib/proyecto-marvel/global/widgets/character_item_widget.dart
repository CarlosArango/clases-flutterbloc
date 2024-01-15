import 'package:flutter/material.dart';
import 'package:flutter_bloc_clases/proyecto-marvel/global/widgets/texts.dart';

class CharacterItemWidget extends StatelessWidget {
  const CharacterItemWidget(
      {super.key, required this.name, required this.image});

  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 40),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19393939),
                  blurRadius: 60,
                  offset: Offset(0, 30),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextMedium(name),
                const SizedBox(height: 2),
                const TextSmall(
                  'Comics 30',
                  color: Color(0xFFFA4A0C),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Positioned.fill(
            top: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100,
                height: 100,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
