import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'fonts/sub_title.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddentext = true;

  double textHeight = 700 / 5.6; //100

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SubTitleText(text: firstHalf)
          : Column(
              children: [
                SubTitleText(
                    text: hiddentext
                        ? ("$firstHalf...")
                        : firstHalf + secondHalf),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;
                    });
                  },
                  child: Row(children: [
                    SubTitleText(
                      text: hiddentext ? "Show more  " : "Show less  ",
                      textColor: AppColors.appColor,
                    ),
                    Icon(
                      hiddentext ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: AppColors.appColor,
                    )
                  ]),
                )
              ],
            ),
    );
  }
}
