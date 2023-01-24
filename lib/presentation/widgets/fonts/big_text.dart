import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? colors;
  final double size;

  const BigText({
    Key? key,
    required this.text,
    required this.colors,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: (size == 0) ? 20 : size,
          fontWeight: FontWeight.bold,
          color: colors),
    );
  }
}
