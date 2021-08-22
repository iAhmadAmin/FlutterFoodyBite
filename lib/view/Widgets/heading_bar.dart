import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:get/get.dart';

class HeadinBar extends StatelessWidget {
  const HeadinBar({
    Key key,
    @required this.label,
    @required this.count,
    @required this.onTap,
  }) : super(key: key);

  final String label, count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: defaultPadding / 2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(Values.see_all.tr + ' ($count)',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: secondaryTextColor,
                      )),
            )
          ],
        ));
  }
}
