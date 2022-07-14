import 'package:flutter/material.dart';
import 'dart:math';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  double result = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: weight,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            TextField(
              controller: height,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (meters)',
              ),
            ),
            ElevatedButton(
              child: const Text("Check BMI"),
              onPressed: () {
                setState(() {
                  double bmi = double.parse(weight.text) /
                      pow(double.parse(height.text), 2);
                  result = double.parse(bmi.toStringAsExponential(2));
                });
              },
            ),
            Text(
              'Your BMI is $result',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView(
              shrinkWrap: true,
              children: const [
                ListTile(
                  title: Text("Underweight"),
                  trailing: Text("less than 18.5"),
                ),
                ListTile(
                  title: Text("Normal weight"),
                  trailing: Text("18.5–24.9"),
                ),
                ListTile(
                  title: Text("Overweight"),
                  trailing: Text("25–29.9"),
                ),
                ListTile(
                  title: Text("Obesity"),
                  trailing: Text("30 or greater"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
