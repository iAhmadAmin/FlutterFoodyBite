import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/controllers/settings_controller.dart';
import 'package:foodybite/view/dialogs/m_dialogs.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:get/get.dart';

enum Language {
  english,
  chinese,
  spanish,
  arabic,
}

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  final _settingsController = Get.find<SettingsController>();
  Language _currentLanguage;

  @override
  void initState() {
    _currentLanguage = _settingsController.currentLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          appBar: AppBar(),
          title: Values.change_language.tr,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: GestureDetector(
                  onTap: () {
                    MDialogs.confirmationDialog(
                      title: Values.are_you_sure_change_language.tr,
                      onNoTap: () {
                        Get.back();
                        setState(() {
                          _currentLanguage =
                              _settingsController.currentLanguage;
                        });
                      },
                      onYesTap: () {
                        Get.back();
                        _settingsController.updateLanguage(_currentLanguage);
                      },
                    );
                  },
                  child: Text(Values.update.tr,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: primaryColor,
                          )),
                ),
              ),
            ),
          ],
        ),
        body: SizedBox.expand(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: defaultPadding,
                left: defaultPadding,
                bottom: defaultPadding / 2,
                top: defaultPadding,
              ),
              child: Align(
                alignment: Get.locale.languageCode == 'ar'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  Values.select_language.tr,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: secondaryTextColor,
                      ),
                ),
              ),
            ),
            ...Language.values.map((l) {
              return LanguageSelector(
                onChanged: (v) {
                  setState(() {
                    _currentLanguage = l;
                  });
                },
                title: l.toString().split('.').last.tr,
                radioValue: _currentLanguage == l ? 1 : 0,
              );
            }).toList(),
          ],
        )));
  }
}

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    @required this.onChanged,
    @required this.title,
    @required this.radioValue,
  });

  final Function onChanged;
  final String title;
  final int radioValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 3,
      ),
      padding: EdgeInsets.only(
        left: Get.locale.languageCode == 'ar'
            ? defaultPadding / 2
            : defaultPadding,
        right: Get.locale.languageCode == 'ar'
            ? defaultPadding
            : defaultPadding / 2,
        top: defaultPadding / 3,
        bottom: defaultPadding / 3,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Radio(
            value: radioValue,
            groupValue: 1,
            onChanged: onChanged,
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
