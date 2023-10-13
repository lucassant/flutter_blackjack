import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/enums/game_status.enum.dart';

import '../components/components.dart';
import '../controllers/game_page.controller.dart';

class GamePage extends StatefulWidget {
  final int numberOfPlayers;
  const GamePage({
    super.key,
    required this.numberOfPlayers,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final controller = GetIt.I<GamePageController>();

  @override
  void initState() {
    controller.initGame(
      numberOfPlayers: widget.numberOfPlayers,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, snapshot) {
                  if (controller.gameStatus == GameStatus.loading) {
                    return const LoadingPageComponent();
                  }

                  if (controller.gameEntity == null) {
                    return const ErrorPageComponent();
                  }

                  if (controller.gameStatus == GameStatus.finished) {
                    return GameOverComponent(
                      gameEntity: controller.gameEntity!,
                    );
                  }

                  final dealer = controller.gameEntity!.players[0];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PlayerCardComponent(
                        cardWidth: cardWidth,
                        playerEntity: dealer,
                      ),
                      ButtonsListComponent(
                        controller: controller,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.gameEntity!.players.length - 1,
                          itemBuilder: (context, index) {
                            final player =
                                controller.gameEntity!.players[index + 1];

                            final bool isLoser =
                                controller.gameEntity!.losers.contains(player);

                            return PlayerCardComponent(
                              cardWidth: cardWidth,
                              playerEntity: player,
                              showDivider: true,
                              isLoser: isLoser,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
