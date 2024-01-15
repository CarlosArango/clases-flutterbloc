import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final String? message;

  const LoaderWidget({Key? key, this.message = "Cargando..."})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Center(
      child: const CircularProgressIndicator(
        backgroundColor: Colors.redAccent,
        color: Colors.black12,
      ),
    );
  }
}

class Loader {
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => LoaderWidget(
        message: message,
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
