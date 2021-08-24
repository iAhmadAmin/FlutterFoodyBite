import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/HomeFlow/Restaurant/restaurant_page.dart';
import 'package:foodybite/view/widgets/review_tile.dart';
import 'package:get/get.dart';

import 'category_chip.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    @required this.restaurant,
    this.forAddReview = false,
    this.selectedForReview = false,
    this.forFavourite = false,
    this.forProfile = false,
    this.menuTap,
    this.closeTap,
    this.addReviewTap,
    this.margin = const EdgeInsets.fromLTRB(
        defaultPadding, defaultPadding, defaultPadding, 0),
  });

  final bool forAddReview, forFavourite, forProfile, selectedForReview;
  final Restaurant restaurant;
  final EdgeInsetsGeometry margin;
  final VoidCallback menuTap, addReviewTap, closeTap;

  @override
  Widget build(BuildContext context) {
    const int noOfFriends = 2;
    const int circleLimit = noOfFriends > 4 ? 4 : noOfFriends;
    const int more = noOfFriends - 4 > 0 ? noOfFriends - 4 : 0;
    return GestureDetector(
      onTap: () {
        Get.to(() => RestaurantPage(
              restaurant: restaurant,
              isBookmarked: forFavourite,
            ));
      },
      child: Container(
          margin: margin,
          height: getRelativeWidth(0.62),
          width: getRelativeWidth(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                ),
              ]),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                    height: getRelativeWidth(0.45),
                    width: getRelativeWidth(1),
                    child: Stack(
                      children: [
                        SizedBox.expand(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(defaultBorderRadius),
                              topRight: Radius.circular(defaultBorderRadius),
                            ),
                            child: Image.asset(
                              restaurant.displayFoodImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (!forAddReview)
                          Positioned(
                            top: defaultPadding,
                            right: defaultPadding,
                            child: RatingChip(
                              rating: restaurant.totalRating,
                            ),
                          ),
                        if (forAddReview)
                          Positioned(
                              top: defaultPadding,
                              right: Get.locale.languageCode == 'ar'
                                  ? null
                                  : defaultPadding,
                              left: Get.locale.languageCode == 'ar'
                                  ? defaultPadding
                                  : null,
                              child: GestureDetector(
                                onTap: closeTap,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 12,
                                  child: Icon(
                                    Icons.close,
                                    size: 18,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              )),
                        if (!forAddReview)
                          Positioned(
                              top: defaultPadding,
                              left: defaultPadding,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2,
                                  vertical: defaultPadding / 6,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        defaultBorderRadius / 2),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(1, 2),
                                        blurRadius: 5,
                                      )
                                    ]),
                                child: Center(
                                  child: Text(
                                    restaurant.isOpen
                                        ? Values.open.tr
                                        : Values.close.tr,
                                    style: TextStyle(
                                      color: restaurant.isOpen
                                          ? Colors.green
                                          : Colors.red,
                                      height: 1.2,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )),
                      ],
                    )),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: getRelativeWidth(0.15),
                  width: getRelativeWidth(1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2,
                      vertical: defaultPadding / 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(restaurant.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      color: textColor,
                                      fontWeight: FontWeight.w800,
                                    )),
                            const SizedBox(
                              width: 6,
                            ),
                            CategoryChip(category: restaurant.category),
                            const SizedBox(
                              width: 6,
                            ),
                            if (!forProfile && !forFavourite)
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        defaultBorderRadius),
                                    color: primaryColor,
                                  ),
                                  child: Text(
                                    '1.2 km',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 8,
                                        ),
                                  )),
                            const Spacer(),
                            if (!forFavourite && !forAddReview)
                              SizedBox(
                                  height: 25,
                                  width: 100,
                                  child: Stack(
                                      alignment: Get.locale.languageCode == 'ar'
                                          ? Alignment.centerLeft
                                          : Alignment.centerRight,
                                      children: [
                                        for (var i = 0; i < circleLimit; i++)
                                          ImageCircle(
                                            imgPath: userList[i].imgPath,
                                            circleNo: i,
                                            more: i == 0 ? more : 0,
                                          ),
                                      ])),
                            if (forProfile)
                              GestureDetector(
                                onTap: menuTap,
                                child: const Icon(Icons.more_vert,
                                    color: textColor),
                              ),
                          ],
                        ),
                        Text(
                          restaurant.address,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: secondaryTextColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (forFavourite)
                Positioned(
                  left: Get.locale.languageCode == 'ar' ? defaultPadding : null,
                  right:
                      Get.locale.languageCode == 'ar' ? null : defaultPadding,
                  bottom: getRelativeWidth(0.12),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      MIcons.bookmark_f,
                      height: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
              if (forAddReview)
                Positioned(
                  right:
                      Get.locale.languageCode == 'ar' ? null : defaultPadding,
                  left: Get.locale.languageCode == 'ar' ? defaultPadding : null,
                  bottom: defaultPadding,
                  child: GestureDetector(
                    onTap: addReviewTap,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          selectedForReview ? Colors.green : primaryColor,
                      child: Icon(
                        selectedForReview ? Icons.done : Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}

class ImageCircle extends StatelessWidget {
  const ImageCircle({
    @required this.imgPath,
    this.circleNo = 0,
    this.more = 0,
    Key key,
  }) : super(key: key);

  final String imgPath;
  final int circleNo;
  final int more;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Get.locale.languageCode == 'ar' ? null : 20.0 * circleNo,
      left: Get.locale.languageCode == 'ar' ? 20.0 * circleNo : null,
      child: CircleAvatar(
        radius: 13,
        backgroundColor: Colors.white,
        child: CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage(imgPath),
            child: Center(
              child: Text(more == 0 ? '' : more.toString()),
            )),
      ),
    );
  }
}
