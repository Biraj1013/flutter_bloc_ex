import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'fonts/grey_text.dart';

class IconRow extends StatelessWidget {
  const IconRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 5, backgroundColor: AppColors.normalIcon),
            const SizedBox(
              width: 2,
            ),
            const GreyText(text: "Normal"),
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.location_pin,
              size: 15,
              color: Colors.lightBlue,
            ),
            SizedBox(
              width: 2,
            ),
            GreyText(text: "1.7Km"),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.timelapse_outlined,
              size: 15,
              color: AppColors.timeIconColor,
            ),
            const SizedBox(
              width: 2,
            ),
            const GreyText(text: "1.7Km"),
          ],
        )
      ],
    );
  }
}
