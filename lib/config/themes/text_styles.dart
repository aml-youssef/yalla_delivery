import 'package:flutter/material.dart';
import 'package:yalla_delivery/config/themes/screen_utitlity.dart';

class MainTheme {
  static TextStyle buttonTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Cairo');

  static TextStyle mainTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: MainColors.mainTextColor,
      fontFamily: 'Cairo');

  static TextStyle hintTextStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: MainColors.mainGray,
      fontFamily: 'Cairo');

  static TextStyle headingTextStyle = const TextStyle(
      fontSize: 58,
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontFamily: 'Cairo');

  static TextStyle headingTextStyle2 = const TextStyle(
    fontSize: 18,
    color: MainColors.selectedIconColor,
    fontFamily: 'Cairo',
  );

  static TextStyle subTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.grey[200],
    fontFamily: 'Cairo',
  );

  static TextStyle subTextStyle2 = const TextStyle(
      fontSize: 10, color: MainColors.mainGray, fontFamily: 'Cairo');

  static TextStyle errorTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontFamily: 'Cairo');
  static TextStyle menuTextStyle =
      const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Cairo');
}
