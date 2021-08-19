import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/AuthFlow/Splash/splash_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Category/category_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Filter/filter_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Home/home_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Profile/profile_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Restaurant/restaurant_page.dart';
import 'package:foodybite/view/pages/RootPage/root_page.dart';
import 'package:get/get.dart';
import 'view/pages/HomeFlow/Reviews/add_review_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    return RootPage();
  }
}
