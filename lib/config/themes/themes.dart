import 'package:flutter/material.dart';
import 'package:yalla_delivery/config/themes/screen_utitlity.dart';

class MainTheme {
  static TextStyle buttonTextStyle = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Cairo');
  static TextStyle hintTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: MainStyle.mainGray,
      fontFamily: 'Cairo');

  static TextStyle headingTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo');

  static TextStyle headingTextStyle2 = const TextStyle(
      fontSize: 18, color: MainStyle.primaryColor, fontFamily: 'Cairo');

  static TextStyle subTextStyle =
      TextStyle(fontSize: 15, color: Colors.grey[200], fontFamily: 'Cairo');
  static TextStyle subTextStyle2 = const TextStyle(
      fontSize: 10, color: MainStyle.mainGray, fontFamily: 'Cairo');

  static TextStyle errorTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontFamily: 'Cairo');
  static TextStyle menuTextStyle =
      const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Cairo');
}
