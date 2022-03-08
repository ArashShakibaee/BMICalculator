import 'package:flutter/material.dart';
import 'package:sport/constants.dart';
import 'package:sport/my_card.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT ME'),
        titleSpacing: 2,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: const Text(
              'Developer Name',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          )),
          const Expanded(
              child: MyCard(
                  color: kOffCardColor,
                  containerChild: Center(
                    child: Text(
                      'ARASH SHAKIBAEE',
                      style: kMyTextStyle,
                    ),
                  ))),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: const Text(
              'Contact With Developer',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
            flex: 4,
            child: MyCard(
              color: kOffCardColor,
              containerChild: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Text(
                      'Phone number :   09392398531',
                      style: kMyTextStyle,
                    ),
                    Text(
                      'Telegram :            @arsha6369',
                      style: kMyTextStyle,
                    ),
                    Text(
                      'Instagram :          _arash.shakibaee_',
                      style: kMyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
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
                    'BACK TO BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
