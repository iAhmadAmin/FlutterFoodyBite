import 'package:flutter/material.dart';
import 'package:foodybite/Utils/size_config.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/images.dart';

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

    Future.delayed(const Duration(seconds: 1), () {
      _slideAnimationController.forward();
    });

    _slideAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
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
      end: 0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
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
