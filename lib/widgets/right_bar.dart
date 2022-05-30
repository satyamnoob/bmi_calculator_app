import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({
    Key? key,
    required this.barWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          // padding: const EdgeInsets.all(30),
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            color: secondaryHexColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
