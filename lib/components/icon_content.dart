import 'package:flutter/material.dart';
import 'constant.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label, this.icon_color});

  final IconData icon;
  final String label;
  Color icon_color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        SizedBox(height: 10.0),
        Icon(
          icon,
          size: 80.0,
          color: icon_color,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
        SizedBox(
          height: 10.0,
        ),

      ],
    );
  }
}
