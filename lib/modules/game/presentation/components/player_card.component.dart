import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import 'cards_list.component.dart';

class PlayerCardComponent extends StatelessWidget {
  final double cardWidth;
  final PlayerEntity playerEntity;
  final bool showDivider;

  const PlayerCardComponent({
    Key? key,
    required this.cardWidth,
    required this.playerEntity,
    this.showDivider = false,
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          '${playerEntity.getScore} pontos',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
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
