import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _currentPassController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        appBar: AppBar(),
        title: Values.change_password.tr,
      ),
      body: SizedBox.expand(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 2),
                InputField(
                  validator: (value) => Validators.passwordValidator(value),
                  hint: Values.current_password.tr,
                  controller: _currentPassController,
                  isPassword: true,
                  iconPath: MIcons.lock,
                  isWhite: false,
                ),
                const SizedBox(height: defaultPadding),
                InputField(
                  validator: (value) => Validators.passwordValidator(value),
                  hint: Values.new_password.tr,
                  controller: _passwordController,
                  isPassword: true,
                  iconPath: MIcons.lock,
                  isWhite: false,
                ),
                const SizedBox(height: defaultPadding),
                InputField(
                  validator: (value) => Validators.confirmPasswordValidator(
                      _passwordController.text, value),
                  hint: Values.confirm_password.tr,
                  controller: _passwordController,
                  isPassword: true,
                  iconPath: MIcons.lock,
                  isWhite: false,
                ),
                const Spacer(),
                MButton(
                  label: Values.update.tr,
                  onTap: () {},
                ),
                const SizedBox(height: defaultPadding),
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    _currentPassController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
