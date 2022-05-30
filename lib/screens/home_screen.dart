import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/left_bar.dart';
import '../widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final heightController = TextEditingController();

  final massController = TextEditingController();

  var bmi = 0.0;

  var category = "";

  String getBMICategory(double bmi) {
    if (bmi <= 15) {
      return "Very Severely Underweight";
    } else if (bmi > 15 && bmi <= 16) {
      return "Severely Underweight";
    } else if (bmi > 16 && bmi <= 18.5) {
      return "Underweight";
    } else if (bmi > 18.5 && bmi <= 25) {
      return "Normal(Healthy)";
    } else if (bmi > 25 && bmi <= 30) {
      return "Overweight";
    } else if (bmi > 30 && bmi <= 35) {
      return "Moderately Obese";
    } else if (bmi > 35 && bmi <= 40) {
      return "Severely Obese";
    } else {
      return "Very Severely Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print("Screen Height = " + screenHeight.toString());
    List<Widget> widgets = [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              textController: heightController,
              hintText: 'Height',
            ),
            CustomTextField(
              textController: massController,
              hintText: 'Mass',
            )
          ],
        ),
      ),
      const Spacer(),
      TextButton(
        child: Text(
          'Calculate',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onPressed: () {
          if (heightController.text == '' ||
              massController.text == '' ||
              double.parse(heightController.text) <= 0.0 ||
              double.parse(massController.text) <= 0.0) {
            return;
          } else {
            setState(() {
              bmi = double.parse(massController.text) /
                  ((double.parse(heightController.text) /
                          100 *
                          double.parse(heightController.text)) /
                      100);
              category = getBMICategory(bmi);
            });
          }
        },
      ),
      const Spacer(),
      Text(
        bmi.round().toString(),
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      const Spacer(),
      SizedBox(
        height: screenHeight * 0.060,
        child: Text(
          category,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      const Spacer(),
      const RightBar(barWidth: 30),
      SizedBox(height: screenHeight * 0.032),
      const RightBar(barWidth: 75),
      SizedBox(height: screenHeight * 0.032),
      const RightBar(barWidth: 30),
      SizedBox(height: screenHeight * 0.015),
      const LeftBar(barWidth: 35),
      SizedBox(height: screenHeight * 0.0300),
      const LeftBar(barWidth: 55),
      SizedBox(height: screenHeight * 0.05),
      const Spacer(),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: primaryHexColor,
                title: const Text('How To Use The App!'),
                content: Text(
                  '1. Enter your height in cms by clicking on Height.\n2. Enter your weight in kgs by clicking on Weight.\n3. Click on Calculate!',
                  style: TextStyle(
                    color: secondaryHexColor,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: Text(
                      'OK',
                      style: TextStyle(color: secondaryHexColor),
                    ),
                  ),
                ],
              ),
            ),
            icon: const Icon(
              Icons.help,
              color: Colors.amber,
            ),
          ),
        ],
        backgroundColor: primaryHexColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...widgets,
          ],
        ),
      ),
    );
  }
}
