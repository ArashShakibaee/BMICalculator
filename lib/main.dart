import 'package:flutter/material.dart';
import 'package:sport/about_me.dart';
import 'package:sport/button_cards.dart';
import 'package:sport/calculate.dart';
import 'my_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'calculator_brain.dart';

void main() {
  runApp(const BMICalculater());
}

class BMICalculater extends StatelessWidget {
  const BMICalculater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

enum Gender { male, female }

class _MyAppState extends State<MyApp> {
  Gender selectedGender = Gender.male;
  int height = 150;
  int number = 70;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculater',
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutMe()));
                },
                icon: const Icon(Icons.person))
          ],
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: MyCard(
                      color: selectedGender == Gender.male
                          ? kOffCardColor
                          : kOnCardColor,
                      containerChild: const IconContent(
                        icon: Icons.male,
                        text: 'MALE',
                      )),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: MyCard(
                    color: selectedGender == Gender.female
                        ? kOffCardColor
                        : kOnCardColor,
                    containerChild: const IconContent(
                      icon: Icons.female,
                      text: 'FEMALE',
                    ),
                  ),
                )),
              ],
            )),
            Expanded(
                child: MyCard(
              color: kOffCardColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kMyTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text('cm', style: kMyTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      activeTrackColor: kActiveSliderColor,
                      inactiveTrackColor: kInactiveSliderColor,
                      thumbColor: kActiveSliderColor,
                      overlayColor: kSliderOverlayColor,
                      trackHeight: 5,
                      thumbShape: RoundSliderThumbShape(
                          pressedElevation: 20, enabledThumbRadius: 10),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120,
                      max: 220,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: MyCard(
                  color: kOffCardColor,
                  containerChild: ButtomCards(
                    addOnpress: () {
                      setState(() {
                        number++;
                      });
                    },
                    subOnpress: () {
                      setState(() {
                        number--;
                      });
                    },
                    number: number,
                    title: 'WEIGHT',
                  ),
                )),
                Expanded(
                    child: MyCard(
                  color: kOffCardColor,
                  containerChild: ButtomCards(
                    subOnpress: () {
                      setState(() {
                        age--;
                      });
                    },
                    addOnpress: () {
                      setState(() {
                        age++;
                      });
                    },
                    title: 'AGE',
                    number: age,
                  ),
                )),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height, number);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Calculate(
                              bmiCalCulate: calc.bmiCalcolate(),
                              kossher: calc.getKossher(),
                              result: calc.getResult(),
                            )));
              },
              child: Container(
                width: double.infinity,
                height: 70,
                margin: const EdgeInsets.only(top: 10),
                color: kButtonColor,
                child: const Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
