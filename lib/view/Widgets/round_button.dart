import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    @required this.label,
    @required this.onTap,
    this.rightRound = true,
    this.leftRound = true,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool rightRound, leftRound;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftRound ? 30 : 0),
            topRight: Radius.circular(rightRound ? 30 : 0),
          ),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
