import 'package:flutter/material.dart';


class StyleConstants {
  static const MAIN_COLOR = Color(0xff7a6da3);//0xffD1A4AC //0xff2980b9//0xff7a6da3
  static const CONTRAST_COLOR = Colors.white;
  static const MAIN_TEXT_FONT_SIZE = 50;
  static const CONTAINER_PADDING = EdgeInsets.all(15);
  static const MARGIN_BOTTOM = 15.0;
  static const BORDER_RADIUS_VALUE = 20.0;
  static const ELEMENT_COLOR = CONTRAST_COLOR;

  static EdgeInsets GetMarginBottom(){
    return EdgeInsets.only(bottom: MARGIN_BOTTOM);
  }

  static EdgeInsets GetContainerMargin(){
    return EdgeInsets.only(left: 50, right: 50, bottom: 50);
  }

  static ButtonStyle GetButtonStyle(){
    return ElevatedButton.styleFrom(
      backgroundColor: ELEMENT_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BORDER_RADIUS_VALUE),
      )
    );
  }

  static TextStyle GetButtonTextStyle(){
    return TextStyle(color: MAIN_COLOR);
  }

  static TextStyle GetContrastButtonTextStyle(){
    return TextStyle(color: CONTRAST_COLOR);
  }

  static BoxDecoration GetContainerBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
        border: Border.all(width: 2, color: CONTRAST_COLOR)
    );
  }

  static TextStyle GetMainTextSyle() {
    return TextStyle(color: CONTRAST_COLOR, fontSize: 70);
  }

  static TextStyle GetBoldTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  static InputDecoration GetInputDecoration(String labelText) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: CONTRAST_COLOR),
        borderRadius: BorderRadius.circular(BORDER_RADIUS_VALUE)
      ),
      labelText: labelText
    );
  }

  static TextStyle GetInputTextStyle() {
    return TextStyle(color: CONTRAST_COLOR, fontSize: 20);
  }

  static BorderRadiusGeometry GetInputBorderRadius() {
    return BorderRadius.circular(BORDER_RADIUS_VALUE);
  }
}
