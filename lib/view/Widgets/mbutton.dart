import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/utils/size_config.dart';

class MButton extends StatelessWidget {
  const MButton({
    this.txtSize,
    this.height,
    this.width,
    @required this.label,
    @required this.onTap,
    this.isFilled = true,
  });

  final String label;
  final VoidCallback onTap;
  final double height, width, txtSize;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 55,
        width: width ?? getRelativeWidth(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          border: isFilled
              ? null
              : Border.all(
                  color: secondaryColor,
                ),
          color: isFilled ? primaryColor : Colors.white,
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: isFilled ? Colors.white : secondaryColor,
                  fontSize: txtSize ?? 14,
                ),
          ),
        ),
      ),
    );
  }
}
