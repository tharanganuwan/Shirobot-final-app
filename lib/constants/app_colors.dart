import 'package:flutter/material.dart';

class AppColors {
  static const Color lightGrey = Color(0xFF929EBA);
  static const Color lightWhite = Color(0xFFF9F9F9);

  static const List<Color> blueGradient = [
    Color(0xFF33C7F6),
    Color(0xFF125F9D)
  ];
  static const List<Color> greenGradient = [
    Color(0xFFA9CC64),
    Color(0xFF437739)
  ];

  static const List<Color> orangeGradient = [
    Color(0xFFFF7F23),
    Color(0xFFF03800)
  ];

  /// 0px -25px 32px ;

  static const List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Color.fromRGBO(82, 130, 255, 0.09),
      blurRadius: 32,
      spreadRadius: 20,
      offset: Offset(0, -25),
    )
  ];
}
