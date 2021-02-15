import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TabButton extends GButton {
  final String text;
  final IconData icon;

  const TabButton({
    Key key,
    this.text,
    this.icon,
  }) : super(
          key: key,
          icon: icon,
          text: text,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
}
