import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final Color? textColor;

  const SubTitleText({
    Key? key,
    required this.text,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 12, height: 1.8, color: textColor),
    );
  }
}
