// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  _BmiDataScreenState createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int age = 20;
  int weight = 60;
  String? gender;

  double bmiCalculate() {
    double heightInMeter = height / 100;
    final x = (heightInMeter * heightInMeter);
    final bmi = weight / x;
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0a0e21),
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "male") ? Colors.yellow : primaryColor,
                    child: GenderIconText(
                      icon: Icons.male,
                      title: 'Male',
                    ),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "female") ? Colors.yellow : primaryColor,
                      child: GenderIconText(
                        icon: Icons.female,
                        title: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
                child: Container(
                    child: BmiCard(
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT", style: genderTextStyle!.copyWith(fontSize: 16)),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("$height",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text("cm", style: genderTextStyle),
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 70,
                    max: 200,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    })
              ],
            )))),
            Expanded(
                child: Container(
                    child: Row(
              children: [
                Expanded(
                    child: BmiCard(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT",
                        style: genderTextStyle!.copyWith(fontSize: 16)),
                    Text("$weight",
                        style: genderTextStyle!.copyWith(fontSize: 50)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            weight += 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color.fromARGB(255, 4, 152, 172),
                          constraints: BoxConstraints.tightFor(
                            width: 56,
                            height: 56,
                          ),
                        ),
                        SizedBox(width: 12),
                        RawMaterialButton(
                          onPressed: () {
                            weight -= 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(Icons.remove, color: Colors.white),
                          shape: CircleBorder(),
                          fillColor: Color.fromARGB(255, 4, 152, 172),
                          constraints: BoxConstraints.tightFor(
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ],
                    )
                  ],
                ))),
                Expanded(
                    child: BmiCard(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: genderTextStyle!.copyWith(fontSize: 16)),
                    Text("$age",
                        style: genderTextStyle!.copyWith(fontSize: 50)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            age += 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color.fromARGB(255, 4, 152, 172),
                          constraints: BoxConstraints.tightFor(
                            width: 56,
                            height: 56,
                          ),
                        ),
                        SizedBox(width: 12),
                        RawMaterialButton(
                          onPressed: () {
                            age -= 1;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(Icons.remove, color: Colors.white),
                          shape: CircleBorder(),
                          fillColor: Color.fromARGB(255, 4, 152, 172),
                          constraints: BoxConstraints.tightFor(
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ],
                    )
                  ],
                ))),
              ],
            ))),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) {
                      return BmiResultScreen(bmi: bmiCalculate());
                    }),
                  ),
                );
              },
              child: Container(
                  height: 60,
                  color: Color.fromARGB(255, 33, 192, 190),
                  child: Center(
                      child: Text("CALCULATE NOW!",
                          style: genderTextStyle!.copyWith(fontSize: 15)))),
            ),
          ],
        ));
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 33, 192, 190),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!),
        ),
        margin: EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: Colors.white),
        const SizedBox(height: 15),
        Text(title, style: genderTextStyle),
      ],
    );
  }
}
