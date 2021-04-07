import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();
  static const Color scaffoldColor = Color(0xFFE5E5E5);
  static const Color almostWhite = Color(0xFFFDFDFD);
  static const Color boxShadow = Color.fromRGBO(237, 239, 241, 0.4);
  static const Color boxShadow2 = Color.fromRGBO(102, 154, 177, 0.32);
  static const Color pink = Color(0xFFEB2B9E);

  static const Color grey = Color.fromRGBO(44, 60, 84, 0.85);
  static const Color grey2 = Color(0xFF939FB0);
  static const Color grey3 = Color(0xFF9CAEB6);
  static const Color grey4 = Color.fromRGBO(112, 124, 141, 0.95);
  static const Color grey5 = Color(0xFF92ACB3);
  static const Color grey6 = Color.fromRGBO(44, 60, 84, 1);
  static const Color grey7 = Color.fromRGBO(112, 124, 141, 0.58);

  static const Color lightGreen = Color.fromRGBO(115, 214, 161, 0.95);
  static const Color borderGrey = Color(0xFFDADFE7);
  static const Color lightBlue = Color(0xFF4EC3F3);
  static const Color lighterBlue = Color(0xFF4EC2F3);

  static const TextStyle title = TextStyle(color: grey, fontSize: 36);
  static const TextStyle titleLight = TextStyle(color: grey, fontSize: 14);

  static const TextStyle bodyText = TextStyle(color: grey2, fontSize: 16);
  static const TextStyle buttonText =
      TextStyle(color: almostWhite, fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle subtitle = TextStyle(color: grey3, fontSize: 14);
  static const TextStyle subtitle2 =
      TextStyle(color: grey4, fontSize: 14, fontWeight: FontWeight.w600);
  static const TextStyle subtitleLight = TextStyle(color: grey4, fontSize: 10);
  static const TextStyle label =
      TextStyle(color: grey6, fontSize: 12, fontWeight: FontWeight.w700);
  static const TextStyle labelLight = TextStyle(color: grey7, fontSize: 12);
}
