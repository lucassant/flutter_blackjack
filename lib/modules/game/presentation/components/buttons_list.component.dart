import 'package:flutter/material.dart';
import 'package:flutter_blackjack/modules/game/presentation/components/custom_button.component.dart';
import 'package:flutter_blackjack/modules/game/presentation/controllers/game_page.controller.dart';

class ButtonsListComponent extends StatelessWidget {
  final GamePageController controller;
  const ButtonsListComponent({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: SizedBox(
        height: 40,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            CustomButton(
              onPressed: () async {
                await controller.newTurn();
              },
              text: 'Pegar carta',
            ),
            const SizedBox(
              width: 8,
            ),
            CustomButton(
              onPressed: () async {
                await controller.shuffleRemainingCards();
              },
              text: 'Embaralhar deck',
            ),
            const SizedBox(
              width: 8,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Sair',
            ),
          ],
        ),
      ),
    );
  }
}
