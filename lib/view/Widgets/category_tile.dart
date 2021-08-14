import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key key,
    @required this.category,
  }) : super(key: key);

  final FCategory category;

  @override
  Widget build(BuildContext context) {
    final List<Color> _colors = getCategoryGradient(category).colors;
    return Container(
      height: getRelativeWidth(0.28),
      width: getRelativeWidth(0.28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: getRelativeWidth(0.3),
            width: getRelativeWidth(0.3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Image.asset(
                Images.food,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: getRelativeWidth(0.3),
            width: getRelativeWidth(0.3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              gradient: LinearGradient(colors: [
                _colors.first.withOpacity(0.5),
                _colors.last.withOpacity(0.5),
              ]),
            ),
          ),
          Text(
            category.toString().split('.').last,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
