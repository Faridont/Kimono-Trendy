import 'package:flutter/material.dart';


class StyleConstants {
  static const PAGE_COLOR = Color(0xff2980b9);//0xffD1A4AC //0xff2980b9
  static const MENU_COLOR = Color(0xff2980b9);
  static const MAIN_TEXT_FONT_SIZE = 50;
  static const CONTAINER_PADDING = EdgeInsets.all(15);
  static const MARGIN_BOTTOM = 15.0;
  static const BORDER_RADIUS_VALUE = 20.0;
  static const ELEMENT_COLOR = Colors.white;

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
    return TextStyle(color: PAGE_COLOR);
  }

  static BoxDecoration GetContainerBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS_VALUE)),
        border: Border.all(width: 2, color: Colors.white)
    );
  }

  static TextStyle GetMainTextSyle() {
    return TextStyle(color: Colors.white, fontSize: 70);
  }

  static TextStyle GetBoldTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold);
  }

  static InputDecoration GetInputDecoration(String labelText) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(BORDER_RADIUS_VALUE)
      ),
      labelText: labelText
    );
  }

  static TextStyle GetInputTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 20);
  }

  static BorderRadiusGeometry GetInputBorderRadius() {
    return BorderRadius.circular(BORDER_RADIUS_VALUE);
  }
}
