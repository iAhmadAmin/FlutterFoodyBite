import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/utils/size_config.dart';

class NoRestaurantTile extends StatelessWidget {
  const NoRestaurantTile({
    @required this.title,
    @required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getRelativeHeight(0.4),
      width: getRelativeWidth(0.9),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        color: Colors.white,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          MIcons.no_food,
          height: getRelativeWidth(0.3),
        ),
        const SizedBox(height: defaultPadding),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: textColor,
              ),
        ),
        const SizedBox(height: defaultPadding),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: secondaryTextColor,
          ),
        )
      ]),
    );
  }
}
