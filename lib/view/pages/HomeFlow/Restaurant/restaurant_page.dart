import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/category_chip.dart';
import 'package:foodybite/view/widgets/heading_bar.dart';
import 'package:glassmorphism/glassmorphism.dart';

class RestaurantPage extends StatelessWidget {
  RestaurantPage({Key key}) : super(key: key);

  final restaurant = restaurantList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {},
          )
        ],
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RestTopTile(),
              RestInfoTile(restaurant: restaurant),
              const SizedBox(height: kPadding / 2),
              const MenuPhotoBar(),
              const SizedBox(height: kPadding * 1.5),
              HeadinBar(label: 'Review & Ratings', count: '32', onTap: () {}),
              const SizedBox(
                height: kPadding / 2,
              ),
              ReviewTile(restaurant: restaurant),
              ReviewTile(restaurant: restaurant),
              const SizedBox(height: kPadding * 2),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding),
      padding: const EdgeInsets.only(bottom: kPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(Images.food),
          ),
          const SizedBox(
            width: kPadding,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jayson Acevedo',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: kTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Spacer(),
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
                ),
                const SizedBox(
                  height: kPadding / 2,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consec tetur'
                  'adipiscing elit, sed do eiusmo temp cididunt'
                  'ut labore et dolore magna aliqua. Ut enim ad'
                  'mini veniam quis.',
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: kSecondaryTextColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuPhotoBar extends StatelessWidget {
  const MenuPhotoBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadinBar(label: 'Menu & Photos', count: '25', onTap: () {}),
        SizedBox(
          height: getRelativeWidth(0.35),
          child: ListView.builder(
              itemCount: 4 + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return index < 4
                    ? Padding(
                        padding: const EdgeInsets.only(left: kPadding),
                        child: SizedBox(
                          height: getRelativeWidth(0.35),
                          width: getRelativeWidth(0.4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kBorderRadius),
                            child: Image.asset(Images.food, fit: BoxFit.cover),
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: kPadding,
                      );
              }),
        ),
      ],
    );
  }
}

class RestTopTile extends StatelessWidget {
  const RestTopTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getRelativeHeight(0.38),
      width: getRelativeWidth(1),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Images.food, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: kPadding,
            right: kPadding * 2,
            left: kPadding * 2,
            child: GlassmorphicContainer(
                height: 45,
                borderRadius: 30,
                blur: 4,
                alignment: Alignment.bottomCenter,
                border: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.05),
                    ],
                    stops: const [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.5),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.call,
                            size: 14,
                            color: kPrimaryColor,
                          )),
                      const SizedBox(
                        width: kPadding / 2,
                      ),
                      Text('+1 212-673-3754',
                          style: TextStyle(color: Colors.white)),
                      VerticalDivider(
                        color: Colors.white,
                        width: kPadding * 2,
                      ),
                      CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.alt_route,
                            size: 16,
                            color: kPrimaryColor,
                          )),
                      const SizedBox(
                        width: kPadding / 2,
                      ),
                      Text('Direction', style: TextStyle(color: Colors.white))
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class RestInfoTile extends StatelessWidget {
  const RestInfoTile({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(restaurant.name,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
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
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kPrimaryColor,
                  ),
                  child: Text(
                    '1.2 km',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                  )),
              const Spacer(),
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
          ),
          const SizedBox(
            height: kPadding / 2,
          ),
          Text(
            restaurant.address,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: kSecondaryTextColor),
          ),
          const SizedBox(
            height: kPadding / 3,
          ),
          RichText(
            text: TextSpan(
                text: 'Open Now',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.green),
                children: [
                  TextSpan(
                    text: ' daily time',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.grey),
                  ),
                  TextSpan(
                    text: ' 09:30 am to 11:00 pm',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.red),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
