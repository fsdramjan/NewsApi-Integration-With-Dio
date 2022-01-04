import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appTheme.dart';
import 'package:news_api/src/pages/homePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      smartManagement: SmartManagement.onlyBuilder,
      home: HomePage(),
    );
  }
}
