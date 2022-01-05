import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/pages/AuthFlow/ForgotPass/forgot_pass_page.dart';
import 'package:foodybite/view/pages/AuthFlow/Register/register_page.dart';
import 'package:foodybite/view/pages/RootPage/root_page.dart';
import 'package:foodybite/view/widgets/app_title.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/mbutton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  Images.login,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox.expand(
                  child: Container(
                color: Colors.black54,
              )),
              SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * 2,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getRelativeHeight(0.15),
                      ),
                      const AppTitle(color: Colors.white),
                      const Spacer(),
                      Form(
                        key: _loginFormKey,
                        child: Column(
                          children: [
                            InputField(
                              iconPath: MIcons.mail,
                              controller: _emailController,
                              hint: Values.email.tr,
                              validator: (val) =>
                                  Validators.emailValidator(val),
                            ),
                            const SizedBox(height: defaultPadding),
                            InputField(
                              iconPath: MIcons.lock,
                              controller: _passwordController,
                              isPassword: true,
                              hint: Values.password.tr,
                              validator: (val) =>
                                  Validators.passwordValidator(val),
                            ),
                            const SizedBox(height: defaultPadding),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Get.locale.languageCode == 'ar'
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ForgotPassPage());
                          },
                          child: Text(
                            Values.forgot_password.tr,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getRelativeHeight(0.2),
                      ),
                      MButton(
                        label: Values.login.tr,
                        onTap: () {
                          //inputValidation,
                          Get.off(() => RootPage());
                        },
                      ),
                      const SizedBox(height: defaultPadding * 5),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => RegisterPage());
                        },
                        child: Text(
                          Values.create_new_account.tr,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void inputValidation() {
    if (_loginFormKey.currentState.validate()) {
      print('validate');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
