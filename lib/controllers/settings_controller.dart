import 'package:flutter/material.dart';
import 'package:foodybite/services/local_db_service.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/ChangeLanguage/change_language_page.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Language currentLanguage;
  Locale currentLocale;
  final _localDBService = LocalDBService();

  @override
  void onInit() {
    final langFromDB = _localDBService.getLanguage();
    print(langFromDB);
    if (langFromDB != null) {
      currentLanguage = _getLanguageByLocale(langFromDB);
      currentLocale = _getLocaleByLanguage(currentLanguage);
    } else {
      currentLocale = Get.deviceLocale;
      currentLanguage = _getLanguageByLocale(currentLocale.languageCode);
    }
    super.onInit();
  }

  void updateLanguage(Language language) {
    final _locale = _getLocaleByLanguage(language);
    Get.updateLocale(_locale);
    _localDBService.saveLanguage(_locale.languageCode);
    currentLanguage = language;
    update();
  }

  Language _getLanguageByLocale(String l_code) {
    switch (l_code) {
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
