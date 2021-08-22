import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/view/dialogs/m_dialogs.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/ChangeLanguage/change_language_page.dart';
import 'package:foodybite/view/pages/ProfilenSettingFlow/ChangePassword/change_password_page.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          appBar: AppBar(),
          title: 'Settings',
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
                    'Account',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: secondaryTextColor,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              SettingButton(
                label: 'Change Password',
                onTap: () {
                  Get.to(() => ChangePasswordPage());
                },
              ),
              SettingButton(
                label: 'change_language'.tr,
                onTap: () {
                  Get.to(() => ChangeLanguagePage());
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: defaultPadding,
                  bottom: defaultPadding / 2,
                  top: defaultPadding,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Others',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: secondaryTextColor,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              SettingButton(
                label: 'Privacy Policy',
                onTap: () {},
              ),
              SettingButton(
                label: 'Terms & Conditions',
                onTap: () {},
              ),
              GestureDetector(
                onTap: () {
                  MDialogs.confirmationDialog(
                    title: 'Are you sure you want to logout?',
                    onNoTap: () {
                      Get.back();
                    },
                    onYesTap: () {},
                  );
                },
                child: Container(
                  height: 50,
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    left: defaultPadding,
                    bottom: defaultPadding,
                    top: defaultPadding,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({
    @required this.label,
    @required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 3,
        ),
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 28,
              color: secondaryTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
