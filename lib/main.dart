import 'package:flutter/material.dart';

import './constants/app_constants.dart';
import './screens/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        canvasColor: primaryHexColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: secondaryHexColor,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: secondaryHexColor,
            fontSize: 50,
          ),
          bodyText2: TextStyle(
            color: secondaryHexColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline5: TextStyle(
            fontSize: 43,
            color: secondaryHexColor,
            fontWeight: FontWeight.normal,
          ),
          headline6: TextStyle(
            fontSize: 11,
            color: secondaryHexColor,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
