import 'package:flutter/material.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/ChangeLanguage/change_language_page.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Language currentLanguage;

  @override
  void onInit() {
    currentLanguage = _getLanguageByLocale(Get.locale);
    super.onInit();
  }

  void updateLanguage(Language language) {
    Get.updateLocale(_getLocaleByLanguage(language));
    currentLanguage = language;
    update();
  }

  Language _getLanguageByLocale(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return Language.english;
      case 'zh':
        return Language.chinese;
      case 'ar':
        return Language.arabic;
      case 'es':
        return Language.spanish;
      default:
        return Language.english;
    }
  }

  Locale _getLocaleByLanguage(Language language) {
    switch (language) {
      case Language.english:
        return const Locale('en', 'US');
      case Language.chinese:
        return const Locale('zh', 'CN');
      case Language.arabic:
        return const Locale('ar', 'SA');
      case Language.spanish:
        return const Locale('es', 'ES');
      default:
        return const Locale('en', 'US');
    }
  }
}
