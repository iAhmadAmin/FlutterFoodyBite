import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({@required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Foodybite",
      style: Theme.of(context).textTheme.headline3.copyWith(
            color: color,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            height: 0.6,
          ),
    );
  }
}
