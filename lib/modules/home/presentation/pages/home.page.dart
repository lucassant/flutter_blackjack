import 'package:flutter/material.dart';

import '../../../game/presentation/pages/game.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GamePage(),
            ),
          );
        },
        child: const Text(
          'Novo jogo',
        ),
      ),
    ));
  }
}
