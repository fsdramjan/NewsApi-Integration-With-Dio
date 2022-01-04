import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_api/src/app.dart';
import 'package:news_api/src/configs/appColors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor:white,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(App());
}
