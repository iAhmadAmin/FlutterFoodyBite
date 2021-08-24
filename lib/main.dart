import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/controllers/settings_controller.dart';
import 'package:foodybite/translations/translation.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/AuthFlow/Splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _con = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: _con.currentLocale ?? Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
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
