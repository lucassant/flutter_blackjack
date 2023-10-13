import 'package:flutter/material.dart';
import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart';

import 'card.component.dart';

class CardsListComponent extends StatelessWidget {
  final double cardWidth;
  final double listHeight;
  final PlayerEntity playerEntity;

  const CardsListComponent({
    super.key,
    required this.cardWidth,
    required this.playerEntity,
    required this.listHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          for (final card in playerEntity.hand)
            CardComponent(
              width: cardWidth,
              imagePath: card.image,
            ),
        ],
      ),
    );
  }
}
