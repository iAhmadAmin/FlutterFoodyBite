import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/view/widgets/app_bar.dart';

enum Language {
  English,
  Chinese,
  Spanish,
  Hindi,
  Arabic,
  Russian,
  Japanese,
  French,
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
          title: 'Change Language',
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: kPadding),
                child: GestureDetector(
                  onTap: () {},
                  child: Text('Update',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: kPrimaryColor,
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
                left: kPadding,
                bottom: kPadding / 2,
                top: kPadding / 2,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Language',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: kSecondaryTextColor,
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
    return Padding(
      padding: const EdgeInsets.only(
        left: kPadding,
        right: kPadding / 2,
      ),
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
            activeColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
