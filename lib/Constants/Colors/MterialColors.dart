import 'package:barley_and_roof/Constants/Colors/AppColors.dart';
import 'package:flutter/material.dart';

class MyMaterialColors {
  Map<int, Color> color = {
    50: Color.fromRGBO(209, 179, 115, .1),
    100: Color.fromRGBO(209, 179, 115, .2),
    200: Color.fromRGBO(209, 179, 115, .3),
    300: Color.fromRGBO(209, 179, 115, .4),
    400: Color.fromRGBO(209, 179, 115, .5),
    500: Color.fromRGBO(209, 179, 115, .6),
    600: Color.fromRGBO(209, 179, 115, .7),
    700: Color.fromRGBO(209, 179, 115, .8),
    800: Color.fromRGBO(209, 179, 115, .9),
    900: Color.fromRGBO(209, 179, 115, 1),
  };
  customMaterialcolor() {
    MaterialColor colorCustom = MaterialColor(
      0xffD1B373,
      color,
    );
    return colorCustom;
  }
}
