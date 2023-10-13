import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final double width;
  final String imagePath;
  const CardComponent({
    super.key,
    required this.width,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Image.network(
        imagePath,
        width: width,
      ),
    );
  }
}
