import 'package:flutter/material.dart';
import 'package:kiu/sources/style_constants.dart';

class AppBarComponent {
  static AppBar Get(String text) {
    return AppBar(
      backgroundColor: StyleConstants.MAIN_COLOR,
      title: Text(text)
    );
  }
}