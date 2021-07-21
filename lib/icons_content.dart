import 'package:flutter/material.dart';
import 'constant.dart';

class IconContent extends StatelessWidget {
  final IconData icons;
  final String label;

  IconContent(this.icons,this.label);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
          ),

      ],
    );
  }
}