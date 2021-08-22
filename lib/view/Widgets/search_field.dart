import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    this.onLeadingTap,
    @required this.hint,
    this.suffixWidget,
    @required this.controller,
    this.onFieldSubmitted,
  });

  final String hint;
  final VoidCallback onLeadingTap;
  final Widget suffixWidget;
  final TextEditingController controller;
  final Function(String value) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorderRadius / 2),
        color: Colors.white,
        border: Border.all(
          color: secondaryTextColor,
          width: 0.2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: textColor,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: textColor),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: secondaryTextColor),
                border: InputBorder.none,
                prefixIcon: Transform.scale(
                  scale: 0.34,
                  child: SvgPicture.asset(
                    MIcons.search,
                    color: secondaryTextColor,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
          if (onLeadingTap != null)
            GestureDetector(
              onTap: onLeadingTap,
              child: Transform.scale(
                scale: 0.55,
                child: SvgPicture.asset(
                  MIcons.filter,
                  color: secondaryTextColor,
                  height: 30,
                ),
              ),
            ),
          const SizedBox(
            width: defaultPadding,
          ),
        ],
      ),
    );
  }
}
