import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:get/get.dart';

class ForgotPassPage extends StatefulWidget {
  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: MAppBar(
          title: Values.forgot_password.tr,
          appBar: AppBar(),
          txtColor: Colors.white,
          bgColor: Colors.transparent,
        ),
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
                        height: getRelativeHeight(0.16),
                      ),
                      Text(Values.enter_email_for_forgot_password.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              )),
                      SizedBox(
                        height: getRelativeHeight(0.06),
                      ),
                      InputField(
                        hint: Values.email.tr,
                        controller: _emailController,
                        iconPath: MIcons.mail,
                        textInputType: TextInputType.emailAddress,
                        validator: (val) => Validators.emailValidator(val),
                      ),
                      const Spacer(),
                      MButton(
                        label: Values.send.tr,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: getRelativeHeight(0.06),
                      ),
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
    _emailController.dispose();
  }
}
