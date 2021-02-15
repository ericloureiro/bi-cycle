import 'package:flutter/material.dart';

class StatsText extends StatelessWidget {
  final String text;
  final double fontSize;

  const StatsText({Key key, this.text, this.fontSize = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
