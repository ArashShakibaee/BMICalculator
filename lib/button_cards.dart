import 'package:flutter/material.dart';
import 'constants.dart';

const BoxConstraints _kSizeConstraints = BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
);

class ButtomCards extends StatelessWidget {
  final int? number;
  final String title;
  final VoidCallback? addOnpress;
  final VoidCallback? subOnpress;
  const ButtomCards(
      {Key? key,
      required this.title,
      this.addOnpress,
      this.subOnpress,
      this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: kMyTextStyle,
        ),
        Text(
          number.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCircularButton(
              onPressed: () {
                return addOnpress;
              },
              icon: Icons.add,
            ),
            const SizedBox(width: 10),
            MyCircularButton(
              onPressed: () {
                return subOnpress;
              },
              icon: Icons.minimize_rounded,
            ),
          ],
        ),
      ],
    );
  }
}

class MyCircularButton extends StatelessWidget {
  final Function onPressed;
  final IconData? icon;
  const MyCircularButton({Key? key, this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed(),
      child: Icon(icon),
      elevation: 8,
      constraints: _kSizeConstraints,
      splashColor: kButtonColor,
      shape: const CircleBorder(),
      fillColor: kButtonColor1,
    );
  }
}
