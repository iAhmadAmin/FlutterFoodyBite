import 'package:flutter/material.dart';
import 'package:foodybite/Utils/size_config.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/Widgets/app_title.dart';
import 'package:foodybite/view/Widgets/input_field.dart';
import 'package:foodybite/view/Widgets/mbutton.dart';
import 'package:foodybite/view/pages/Register/register_page.dart';
import 'package:get/get.dart';

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
                    horizontal: kPadding * 2,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getRelativeHeight(0.1),
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
                              hint: 'Email',
                              validator: (val) =>
                                  Validators.emailValidator(val),
                            ),
                            const SizedBox(height: kPadding),
                            InputField(
                              iconPath: MIcons.lock,
                              controller: _passwordController,
                              isPassword: true,
                              hint: 'Password',
                              validator: (val) =>
                                  Validators.passwordValidator(val),
                            ),
                            const SizedBox(height: kPadding),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(height: kPadding * 5),
                      MButton(
                        label: 'Login',
                        onTap: inputValidation,
                      ),
                      const SizedBox(height: kPadding * 5),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => RegisterPage());
                        },
                        child: Text(
                          'Create New Account',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                      const SizedBox(height: kPadding),
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
