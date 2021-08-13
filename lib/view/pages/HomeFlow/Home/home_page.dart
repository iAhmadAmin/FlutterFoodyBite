import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SearchField(),
          HeadinBar(
            label: 'Trending Restaurants',
            count: '29',
            onTap: () {},
          ),
          RestaurantTile(
            restaurant: restaurantList[0],
          ),
        ],
      ),
    ));
  }
}

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getRelativeWidth(0.7),
        width: getRelativeWidth(0.9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
                height: getRelativeWidth(0.5),
                width: getRelativeWidth(0.9),
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
              height: getRelativeWidth(0.2),
              width: getRelativeWidth(0.9),
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(restaurant.name,
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: kTextColor,
                                      fontWeight: FontWeight.w800,
                                    ))
                      ],
                    ),
                    Text(
                      restaurant.address,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
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
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: kTextColor),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text('See all ($count)',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: kSecondaryTextColor,
                      )),
            )
          ],
        ));
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kPadding,
        vertical: kPadding,
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
