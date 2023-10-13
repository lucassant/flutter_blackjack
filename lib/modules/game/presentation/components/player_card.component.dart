import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import 'cards_list.component.dart';

class PlayerCardComponent extends StatelessWidget {
  final double cardWidth;
  final PlayerEntity playerEntity;
  final bool showDivider;
  final bool isLoser;

  const PlayerCardComponent({
    Key? key,
    required this.cardWidth,
    required this.playerEntity,
    this.showDivider = false,
    this.isLoser = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showDivider ? const Divider() : const SizedBox.shrink(),
        const SizedBox(
          height: 8,
        ),
        Text(
          playerEntity.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: isLoser ? Colors.red[900] : Colors.white,
          ),
        ),
        Text(
          '${playerEntity.getScore} pontos',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: isLoser ? Colors.red[900] : Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CardsListComponent(
          cardWidth: cardWidth,
          playerEntity: playerEntity,
          listHeight: 100,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
