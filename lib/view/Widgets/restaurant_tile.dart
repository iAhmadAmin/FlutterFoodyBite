import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
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
    this.forFavourite = false,
    this.forProfile = false,
    this.menuTap,
    this.margin = const EdgeInsets.fromLTRB(
        defaultPadding, defaultPadding, defaultPadding, 0),
  });

  final bool forAddReview, forFavourite, forProfile;
  final Restaurant restaurant;
  final EdgeInsetsGeometry margin;
  final VoidCallback menuTap;

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
                            child: Hero(
                              tag: restaurant.displayFoodImg,
                              child: Image.asset(
                                restaurant.displayFoodImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: defaultPadding,
                          right: defaultPadding,
                          child: forAddReview
                              ? GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 12,
                                    child: Icon(
                                      Icons.close,
                                      size: 18,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                )
                              : RatingChip(
                                  rating: restaurant.totalRating,
                                ),
                          // Container(
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: defaultPadding / 2,
                          //       vertical: defaultPadding / 6,
                          //     ),
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(
                          //             defaultBorderRadius / 2),
                          //         boxShadow: const [
                          //           BoxShadow(
                          //             color: Colors.black12,
                          //             offset: Offset(1, 2),
                          //             blurRadius: 5,
                          //           )
                          //         ]),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.star,
                          //           size: 18,
                          //           color: Colors.yellow[700],
                          //         ),
                          //         const SizedBox(width: 4),
                          //         Text(
                          //           restaurant.totalRating.toString(),
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .caption
                          //               .copyWith(
                          //                   fontWeight: FontWeight.w800),
                          //         ),
                          //       ],
                          //     ))
                        ),
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
                                    restaurant.isOpen ? 'OPEN' : 'CLOSE',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                            color: restaurant.isOpen
                                                ? Colors.green
                                                : Colors.red,
                                            height: 1.2,
                                            fontWeight: FontWeight.w600),
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
                                    horizontal: defaultPadding * 0.55,
                                    vertical: defaultPadding * 0.2,
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
                                          fontSize: 10,
                                        ),
                                  )),
                            const Spacer(),
                            if (!forFavourite && !forAddReview)
                              SizedBox(
                                  height: 25,
                                  width: 100,
                                  child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        for (var i = 0; i < circleLimit; i++)
                                          ImageCircle(
                                            imgPath: Images.food,
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
                              .copyWith(color: ktextColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (forFavourite)
                Positioned(
                  right: defaultPadding,
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
      right: 20.0 * circleNo,
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
