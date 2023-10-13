import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import 'components.dart';

class GameOverComponent extends StatelessWidget {
  final GameEntity gameEntity;
  const GameOverComponent({
    super.key,
    required this.gameEntity,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    final screenHeight = MediaQuery.of(context).size.height - 32;

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const Center(
          child: Text(
            'Jogo finalizado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Text(
            'Foram jogadas ${gameEntity.rounds} rodadas',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'Vencedores:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        ...gameEntity.winners.map(
          (winner) => Column(
            children: [
              Text(
                '${winner.name} com ${winner.getScore} pontos',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CardsListComponent(
                cardWidth: screenWidth / 5,
                playerEntity: winner,
                listHeight: (screenHeight / gameEntity.players.length) - 100,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'Perdedores:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        ...gameEntity.losers.map(
          (loser) => Column(
            children: [
              Text(
                '${loser.name} com ${loser.getScore} pontos',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CardsListComponent(
                cardWidth: screenWidth / 5,
                playerEntity: loser,
                listHeight: (screenHeight / gameEntity.players.length) - 100,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          text: 'Voltar para o menu',
        ),
      ],
    );
  }
}
