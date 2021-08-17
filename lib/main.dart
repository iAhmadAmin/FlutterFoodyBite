import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/AuthFlow/ForgotPass/forgot_pass_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Filter/filter_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Home/home_page.dart';
import 'package:foodybite/view/pages/HomeFlow/MenuPhoto/menu_photo_page.dart';
import 'package:foodybite/view/pages/HomeFlow/PhotoView/photo_view_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Restaurant/restaurant_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Trending/trending_restaurants_page.dart';
import 'package:foodybite/view/pages/RootPage/root_page.dart';
import 'package:get/get.dart';

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
    return HomePage();
  }
}
