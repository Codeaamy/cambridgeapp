import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress, this.shadowColor});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor == null ? Colors.grey : shadowColor,
              blurRadius: 10.0,
//              spreadRadius: 10.0,

            ),
          ],
        ),
      ),
    );
  }
}
