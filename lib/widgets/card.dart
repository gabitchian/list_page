import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  int num;
  MyCard({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCard();
}

class _MyCard extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: widget.key,
        alignment: Alignment.center,
        width: 350,
        height: 120,
        color: Colors.cyan[700],
        child: Text(
          "Card ${widget.num}",
          style: TextStyle(color: Colors.white),
        ));
  }
}
