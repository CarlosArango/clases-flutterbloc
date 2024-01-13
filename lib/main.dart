import 'package:flutter/material.dart' hide RouterConfig;
import 'package:flutter_bloc_clases/proyecto-marvel/config/router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: RouterConfig.router,
    );
  }
}
