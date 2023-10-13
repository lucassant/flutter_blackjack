import 'package:flutter/material.dart';

class ErrorPageComponent extends StatelessWidget {
  const ErrorPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Erro ao carregar o jogo, tente novamente',
    );
  }
}
