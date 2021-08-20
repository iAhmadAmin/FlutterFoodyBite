import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    this.onLeadingTap,
    this.hint = 'Search',
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
        horizontal: kPadding,
      ),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius / 2),
        color: Colors.white,
        border: Border.all(
          color: kSecondaryTextColor,
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
              cursorColor: kTextColor,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: kTextColor),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: kSecondaryTextColor),
                border: InputBorder.none,
                prefixIcon: Transform.scale(
                  scale: 0.34,
                  child: SvgPicture.asset(
                    MIcons.search,
                    color: kSecondaryTextColor,
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
                  color: kSecondaryTextColor,
                  height: 30,
                ),
              ),
            ),
          const SizedBox(
            width: kPadding,
          ),
        ],
      ),
    );
  }
}
