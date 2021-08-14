import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

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
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 5,
            ),
          ]),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: kTextColor,
        style:
            Theme.of(context).textTheme.subtitle1.copyWith(color: kTextColor),
        decoration: InputDecoration(
          hintText: 'Find Restaurants',
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: kSecondaryTextColor),
          border: InputBorder.none,
          prefixIcon: Transform.scale(
            scale: 0.4,
            child: SvgPicture.asset(
              MIcons.search,
              color: kSecondaryTextColor,
              height: 30,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Transform.scale(
              scale: 0.4,
              child: SvgPicture.asset(
                MIcons.filter,
                color: kSecondaryTextColor,
                height: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
