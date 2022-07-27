import 'package:flutter/material.dart';
import 'dart:math';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  // TextEditingController weight = TextEditingController();
  // TextEditingController height = TextEditingController();
  double result = 0.00;
  double _heightValue = 0.0;
  bool? isMale;

  Color themeColor = Color(0xff0C0D23);
  Color tileColor = Color(0xff1F1D35);
  Color redColor = Color(0xffEC1458);
  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: themeColor,
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Container(
        color: themeColor,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                        color: tileColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.male, color: Colors.white, size: 100),
                        const Text("MALE",
                            style: TextStyle(color: Colors.grey, fontSize: 25))
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.female, color: Colors.white, size: 100),
                        Text("FEMALE",
                            style: TextStyle(color: Colors.grey, fontSize: 25))
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Text("HEIGHT",
                        style: TextStyle(color: Colors.grey, fontSize: 25)),
                    SizedBox(height: 2),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${_heightValue.toStringAsFixed(2)}",
                              style: textStyle),
                          Text("cm",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 25)),
                        ]),
                    //SizedBox(height: 15),
                    Slider(
                        min: 0.0,
                        max: 300.0,
                        thumbColor: redColor,
                        activeColor: Color.fromARGB(255, 177, 177, 177),
                        value: _heightValue,
                        onChanged: (value) {
                          setState(() {
                            _heightValue = value;
                          });
                        }),
                  ],
                ),
              )),
          SizedBox(height: 20),
          Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("WEIGHT",
                          style: TextStyle(color: Colors.grey, fontSize: 25)),
                      Text("65", style: textStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff4F4F5D)),
                            child:
                                Icon(Icons.add, size: 50, color: Colors.white),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff4F4F5D)),
                            child: Icon(Icons.remove,
                                size: 50, color: Colors.white),
                          )
                        ],
                      )
                    ]),
              )),
          SizedBox(height: 20),
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: redColor,
                  child: Text("CALCULATE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)))),
        ]),
      ),
    );
  }
}
