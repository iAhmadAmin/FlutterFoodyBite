import 'package:flutter/material.dart';
import 'package:foodybite/utils/size_config.dart';
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
