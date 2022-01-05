import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/AuthFlow/Splash/splash_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.initSize(context);
    return SplashPage();
  }
}
