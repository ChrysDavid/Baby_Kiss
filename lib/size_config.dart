import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Obtenez la hauteur proportionnelle selon la taille de l'écran
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 est la hauteur de disposition utilisée par le concepteur
  return (inputHeight / 812.0) * screenHeight;
}

// Obtenez la hauteur proportionnelle selon la taille de l'écran
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 est la largeur de mise en page utilisée par le concepteur
  return (inputWidth / 375.0) * screenWidth;
}
