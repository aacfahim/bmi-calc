import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double result = 0.00;
  double _heightValue = 0.0;
  int weight = 0;
  bool isMale = true;

  String checkHealth() {
    if (result < 18.5) {
      return "Underweight";
    } else if (result >= 18.5 && result <= 24.9) {
      return "Normal";
    } else {
      return "Overweight";
    }
  }

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
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                          color: isMale == true ? tileColor : themeColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.male, color: Colors.white, size: 100),
                          const Text("MALE",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 25))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //isMale = true;
                      setState(() {
                        isMale = !isMale;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                          color: isMale == false ? themeColor : tileColor,
                          //color: themeColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.female, color: Colors.white, size: 100),
                          Text("FEMALE",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 25))
                        ],
                      ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT",
                          style: TextStyle(color: Colors.grey, fontSize: 25)),
                      Text("${weight}", style: textStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              if (weight > 0) weight--;
                            }),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4F4F5D)),
                              child: Icon(Icons.remove,
                                  size: 50, color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() {
                              weight++;
                            }),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff4F4F5D)),
                              child: Icon(Icons.add,
                                  size: 50, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ]),
              )),
          SizedBox(height: 20),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  double bmi =
                      weight / (_heightValue / 100 * _heightValue / 100);
                  result = double.parse(bmi.toStringAsExponential(2));
                  if (bmi > 0) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              width: 100,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                color: tileColor,
                              ),
                              alignment: Alignment.center,
                              child: Column(children: [
                                Text(
                                  "${result}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35),
                                ),
                                Text(checkHealth(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                                ListView(
                                  shrinkWrap: true,
                                  children: const [
                                    ListTile(
                                      title: Text("Underweight",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      trailing: Text("less than 18.5",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    ListTile(
                                      title: Text("Normal weight",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      trailing: Text("18.5–24.9",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    ListTile(
                                      title: Text("Overweight",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      trailing: Text("25–29.9",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    ListTile(
                                      title: Text("Obesity",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      trailing: Text("30 or greater",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          );
                        });
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: redColor,
                    child: Text("CALCULATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold))),
              )),
        ]),
      ),
    );
  }
}
