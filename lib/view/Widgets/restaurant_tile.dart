import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'category_chip.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key key,
    @required this.restaurant,
    this.margin = const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
  }) : super(key: key);

  final Restaurant restaurant;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    const int noOfFriends = 2;
    const int circleLimit = noOfFriends > 4 ? 4 : noOfFriends;
    const int more = noOfFriends - 4 > 0 ? noOfFriends - 4 : 0;
    return Container(
        margin: margin,
        height: getRelativeWidth(0.7),
        width: getRelativeWidth(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 2),
                blurRadius: 12,
              ),
            ]),
        child: Column(
          children: [
            SizedBox(
                height: getRelativeWidth(0.5),
                width: getRelativeWidth(1),
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(kBorderRadius),
                          topRight: Radius.circular(kBorderRadius),
                        ),
                        child: Image.asset(
                          restaurant.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: kPadding,
                        right: kPadding,
                        child: Container(
                            height: 26,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius / 2),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 2),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.yellow[700],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  restaurant.rating.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ))),
                    Positioned(
                        top: kPadding,
                        left: kPadding,
                        child: Container(
                          height: 26,
                          width: 60,
                          padding: const EdgeInsets.symmetric(
                            horizontal: kPadding / 2,
                            vertical: kPadding / 6,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius / 2),
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
            SizedBox(
              height: getRelativeWidth(0.17),
              width: getRelativeWidth(1),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kPadding / 2,
                  vertical: kPadding / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Text(restaurant.name,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: kTextColor,
                                      fontWeight: FontWeight.w800,
                                    )),
                        const SizedBox(
                          width: 6,
                        ),
                        CategoryChip(category: restaurant.category),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: kPadding * 0.55,
                              vertical: kPadding * 0.2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              color: kPrimaryColor,
                            ),
                            child: Text(
                              '1.2 km',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                            )),
                        const Spacer(),
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
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      restaurant.address,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: kSecondaryTextColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
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
