import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/view/pages/AuthFlow/Login/login_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _slideAnimationController;
  Animation<Offset> _slideAnimation;
  Animation<double> _rotateAnimation;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1100), () {
      _slideAnimationController.forward();
    });

    Future.delayed(const Duration(milliseconds: 2400), () {
      Get.off(() => LoginPage());
    });

    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.linear,
    ));

    _rotateAnimation = Tween<double>(
      begin: -0.06,
      end: 0.01,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.2,
      end: 1.45,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _slideAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: RotationTransition(
                turns: _rotateAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    Images.splash,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation,
              child: Text(
                "Foodybite",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
