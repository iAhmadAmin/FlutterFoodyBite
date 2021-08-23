import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/RootPage/root_page.dart';
import 'package:foodybite/view/widgets/app_title.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  Images.welcome,
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
                    horizontal: defaultPadding,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getRelativeHeight(0.04),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(
                            () => RootPage(),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GlassmorphicContainer(
                            width: 90,
                            height: 40,
                            borderRadius: 12,
                            blur: 3,
                            alignment: Alignment.bottomCenter,
                            border: 0,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.15),
                                  const Color(0xFFFFFFFF).withOpacity(0.05),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ]),
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.15),
                                Colors.white.withOpacity(0.5),
                              ],
                            ),
                            child: Center(
                              child: Text(Values.skip.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      )),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '''
                        ${Values.hi.tr} John
                        ${Values.welcome_to.tr}
                        ''',
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              height: 0.6,
                            ),
                      ),
                      Align(
                        alignment: Get.locale.languageCode == 'ar'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: const AppTitle(color: Colors.yellow),
                      ),
                      SizedBox(
                        height: getRelativeHeight(0.12),
                      ),
                      Text(Values.please_turn_on_gps.tr,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              )),
                      SizedBox(
                        height: getRelativeHeight(0.12),
                      ),
                      MButton(
                        label: Values.turn_on_gps.tr,
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
}
