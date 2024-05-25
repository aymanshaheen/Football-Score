import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color white = Color(0xFFFAFAFA);
  static const Color white40 =  Color.fromARGB(255, 199, 199, 199);
  static const Color white70 = Colors.white70;
  static  Color? white50 = Colors.grey[700];
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color red = Color.fromARGB(255, 228, 13, 45);
  static const Color lightRed = Color(0xFFF44336);
  static const Color blueGrey = Color(0xFF607D8B);
  static const Color green = Color.fromARGB(255, 39, 238, 72);
  static const Color darkgreen = Color.fromARGB(255, 5, 128, 25);
  static const Color darkGreen = Color(0xFF4CAF50);
  static const Color yellow = Color(0xFFE7E20E);
  static const Color blue = Color(0xFF4373D9);
  static const Color darkBlue = Color(0xFF133E99);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color darkgrey = Color.fromARGB(255, 26, 25, 25);
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[darkBlue, blue],
  );
  static const LinearGradient redGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[lightRed, red],
  );
}
