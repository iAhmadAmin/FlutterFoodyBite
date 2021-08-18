import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/HomeFlow/Category/category_restaurants_page.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    @required this.category,
    this.height,
    this.width,
    this.showDivider = false,
  });

  final FCategory category;
  double height, width;
  bool showDivider;

  @override
  Widget build(BuildContext context) {
    final List<Color> _colors = getCategoryGradient(category).colors;
    height = height ?? getRelativeWidth(0.28);
    width = width ?? getRelativeWidth(0.28);
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CategoryRestaurantsPage(
            category: category,
          ),
        );
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: height,
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: Hero(
                  tag: category,
                  child: Image.asset(
                    Images.getCategoryImage(category),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: height,
              width: width,
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
            if (showDivider)
              Positioned(
                right: kPadding,
                child: Container(
                    height: 30,
                    width: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white.withOpacity(0.5),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
