import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({
    Key? key,
    required this.barWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          // padding: const EdgeInsets.all(30),
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            color: secondaryHexColor,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
