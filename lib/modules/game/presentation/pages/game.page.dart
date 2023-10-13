import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width - 32;

    final double cardWidth = screenWidth / 5;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[600],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('Mesa'),
                    const Text('20 pontos'),
                    Row(
                      children: [
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Nova rodada',
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                        Image.network(
                          'https://deckofcardsapi.com/static/img/KH.png',
                          width: cardWidth,
                        ),
                      ],
                    ),
                    Text('Jogador'),
                    Text('20 pontos'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
