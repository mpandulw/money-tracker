import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(50, 130, 184, 0),
      foregroundColor: const Color.fromARGB(255, 51, 51, 255),
    ),
    fontFamily: 'Montserrat',
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'Montserrat',
  );
}
