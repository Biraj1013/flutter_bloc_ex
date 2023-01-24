import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  final String text;
  // final Color? colors;

  const GreyText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
    );
  }
}
