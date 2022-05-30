import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController textController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextField(
        controller: textController,
        cursorColor: Colors.white,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
