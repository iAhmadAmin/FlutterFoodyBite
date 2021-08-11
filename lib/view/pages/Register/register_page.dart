import 'package:flutter/material.dart';
import 'package:foodybite/Utils/size_config.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/Widgets/input_field.dart';
import 'package:foodybite/view/Widgets/mbutton.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  Images.register,
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
                        height: getRelativeHeight(0.04),
                      ),
                      Form(
                        child: Column(
                          children: [
                            InputField(
                              controller: _nameController,
                              hint: 'Name',
                              iconPath: MIcons.user_o,
                            ),
                            const SizedBox(height: kPadding),
                            InputField(
                              controller: _emailController,
                              hint: 'Email',
                              iconPath: MIcons.mail,
                              validator: (val) =>
                                  Validators.emailValidator(val),
                            ),
                            const SizedBox(height: kPadding),
                            InputField(
                              controller: _passwordController,
                              hint: 'Password',
                              iconPath: MIcons.lock,
                              validator: (val) =>
                                  Validators.passwordValidator(val),
                            ),
                            const SizedBox(height: kPadding),
                            InputField(
                              controller: _confirmPasswordController,
                              hint: 'Confirm Password',
                              iconPath: MIcons.lock,
                              validator: (val) =>
                                  Validators.confirmPasswordValidator(
                                      _passwordController.text, val),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: kPadding * 3),
                      MButton(
                        label: 'Register',
                        onTap: () {},
                      ),
                      const SizedBox(height: kPadding * 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ],
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

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }
}
