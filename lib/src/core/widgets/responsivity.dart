import 'package:flutter/widgets.dart';

class R {
  static double W(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double H(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double F(BuildContext context, double size) {
    return size * W(context) / 375.0;
  }

  static double sW(BuildContext context, double size) {
    return size * W(context) / 375.0;
  }

  static double sH(BuildContext context, double size) {
    return size * H(context) / 812.0;
  }

  static double sP(BuildContext context, double size) {
    return size * W(context) / 375.0;
  }

  static double sR(BuildContext context, double size) {
    return size * W(context) / 375.0;
  }
}