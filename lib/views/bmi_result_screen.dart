// ignore_for_file: empty_statements, prefer_const_constructors

import 'package:bmi/constants/constants.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;
  String bmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue >= 16.0 && bmiValue < 16.99) {
      category = underweightModerate;
    } else if (bmiValue >= 17 && bmiValue < 18.4) {
      category = underweightMild;
    } else if (bmiValue >= 18.5 && bmiValue < 24.9) {
      category = normal;
    } else if (bmiValue >= 25 && bmiValue < 29.9) {
      category = overweight;
    } else if (bmiValue >= 30 && bmiValue < 34.9) {
      category = obeseI;
    } else if (bmiValue >= 35 && bmiValue < 39.9) {
      category = obeseII;
    } else if (bmiValue >= 40) {
      category = obeseIII;
    }
    return category;
  }

  healDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis";
        break;
      case normal:
        desc = "Low risk (healthy range)";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease,high blood pressure,diabetes mellitus";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        "Moderate risk of developing heart disease,high blood pressure,diabetes mellitus,metabolic syndrome";
        break;
      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0a0e21),
        appBar: AppBar(
          title: Text("Your Results"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Center(
                child: Text("Results",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            )),
            Expanded(
                flex: 5,
                child: BmiCard(
                    child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(bmiCategory(bmi),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Text(bmi.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 75,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Text(healDescription(bmiCategory(bmi)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ))),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 60,
                  color: Color.fromARGB(255, 33, 192, 190),
                  child: Center(
                      child: Text("RE-CALCULATE!",
                          style: genderTextStyle!.copyWith(fontSize: 15)))),
            ),
          ],
        ));
  }
}
