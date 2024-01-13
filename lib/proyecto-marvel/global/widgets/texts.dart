import 'package:flutter/material.dart';

class TextSmall extends StatelessWidget {
  const TextSmall(
    this.data, {
    super.key,
    this.color = Colors.black,
  });

  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  const TextMedium(
    this.data, {
    super.key,
    this.color = Colors.black,
  });

  final String data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class TextLarge extends StatelessWidget {
  const TextLarge(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
        ));
  }
}
