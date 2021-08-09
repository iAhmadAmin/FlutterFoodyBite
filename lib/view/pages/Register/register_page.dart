import 'package:flutter/material.dart';
import 'package:foodybite/Utils/size_config.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/view/Widgets/app_title.dart';
import 'package:foodybite/view/Widgets/input_field.dart';
import 'package:foodybite/view/Widgets/mbutton.dart';

class RegisterPage extends StatelessWidget {
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
                      const InputField(
                        hint: 'Name',
                      ),
                      const SizedBox(height: kPadding),
                      const InputField(
                        hint: 'Email',
                      ),
                      const SizedBox(height: kPadding),
                      const InputField(
                        hint: 'Password',
                      ),
                      const SizedBox(height: kPadding),
                      const InputField(
                        hint: 'Confirm Password',
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
}
