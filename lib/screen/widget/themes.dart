import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
    surface: Color(0xFFF8ECE5),
  ),
  fontFamily: "Poppins",
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    surface: Color(0xFFF8ECE5),
  ),
  fontFamily: "Poppins",
);

FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
