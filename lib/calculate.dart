import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport/my_card.dart';
import 'constants.dart';

class Calculate extends StatelessWidget {
  final String bmiCalCulate;
  final String result;
  final String kossher;
  const Calculate(
      {Key? key,
      required this.bmiCalCulate,
      required this.kossher,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Your Result',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Expanded(
            flex: 8,
            child: MyCard(
              color: kOffCardColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      result.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    bmiCalCulate,
                    style: const TextStyle(
                        fontSize: 80, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    kossher,
                    style: const TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 70,
              margin: const EdgeInsets.only(top: 10),
              color: kButtonColor,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
