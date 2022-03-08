import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget containerChild;
  const MyCard({
    Key? key,
    required this.color,
    required this.containerChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(15),
      child: containerChild,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
