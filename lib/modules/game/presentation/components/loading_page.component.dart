import 'package:flutter/material.dart';

class LoadingPageComponent extends StatelessWidget {
  const LoadingPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: Colors.black,
      color: Colors.white,
    );
  }
}
