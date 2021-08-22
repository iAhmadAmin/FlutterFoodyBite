import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:get/get.dart';

enum Language {
  English,
  Chinese,
  Spanish,
  Arabic,
}

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  Language _currentLanguage = Language.English;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          appBar: AppBar(),
          title: Values.change_language.tr,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: GestureDetector(
                  onTap: () {},
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
                left: defaultPadding,
                bottom: defaultPadding / 2,
                top: defaultPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
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
                    Get.updateLocale(
                      const Locale('zh', 'CN'),
                    );
                  });
                },
                title: l.toString().split('.').last,
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
      padding: const EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding / 2,
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
