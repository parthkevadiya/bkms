import 'package:flutter/material.dart';

class ScreenSize {
  static double height = 0;
  static double width = 0;

  static setSize(context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
