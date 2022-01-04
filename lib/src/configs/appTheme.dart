import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: white,
    fontFamily: regular,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: white,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 14,
      ),
      iconTheme: IconThemeData(
        color: black,
      ),
    ),
  );
}
