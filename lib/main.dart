import 'package:flutter/material.dart';
import 'package:flutter_blackjack/modules/home/presentation/pages/home.page.dart';

import 'modules/app.module.dart';

void main() {
  final appModule = AppModule();
  appModule.initModules();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blackjack',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
