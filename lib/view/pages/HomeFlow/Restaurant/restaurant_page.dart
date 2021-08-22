import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/HomeFlow/MenuPhoto/menu_photo_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Reviews/add_review_page.dart';
import 'package:foodybite/view/pages/HomeFlow/Reviews/review_rating_page.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/category_chip.dart';
import 'package:foodybite/view/widgets/heading_bar.dart';
import 'package:foodybite/view/widgets/review_tile.dart';
import 'package:foodybite/view/widgets/round_button.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({
    @required this.restaurant,
    this.isBookmarked = false,
  });

  final Restaurant restaurant;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MAppBar(
        title: '',
        appBar: AppBar(),
        txtColor: Colors.white,
        bgColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_outline),
            onPressed: () {},
          )
        ],
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RestTopTile(imgPath: restaurant.displayFoodImg),
                    RestInfoTile(restaurant: restaurant),
                    const SizedBox(height: defaultPadding / 2),
                    const MenuPhotoBar(),
                    const SizedBox(height: defaultPadding * 2),
                    HeadinBar(
                        label: Values.review_n_ratings.tr,
                        count: '32',
                        onTap: () {
                          Get.to(() => const ReviewRatingPage(
                                showMyRatings: false,
                              ));
                        }),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    ReviewTile(
                      review: reviewList[0],
                    ),
                    ReviewTile(review: reviewList[1]),
                    const SizedBox(height: defaultPadding * 3),
                  ],
                ),
              ),
            ),
            if (!isBookmarked)
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: RoundButton(
                    label: Values.rate_your_experience.tr,
                    onTap: () {
                      Get.to(
                        () => AddReviewPage(),
                      );
                    }),
              ),
          ],
        ),
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
    final foodPhotos = foodsImgList.getRange(1, 4).toList();
    return Column(
      children: [
        HeadinBar(
            label: Values.menu_n_photos.tr,
            count: '25',
            onTap: () {
              Get.to(() => const MenuPhotoPage());
            }),
        const SizedBox(height: defaultPadding / 2),
        SizedBox(
          height: getRelativeWidth(0.35),
          child: ListView.builder(
              itemCount: foodPhotos.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return index < foodPhotos.length
                    ? Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: SizedBox(
                          height: getRelativeWidth(0.35),
                          width: getRelativeWidth(0.4),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            child: Image.asset(foodPhotos[index],
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: defaultPadding,
                      );
              }),
        ),
      ],
    );
  }
}

class RestTopTile extends StatelessWidget {
  final String imgPath;
  const RestTopTile({@required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getRelativeHeight(0.38),
      width: getRelativeWidth(1),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Hero(
                tag: imgPath, child: Image.asset(imgPath, fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding * 2,
            left: defaultPadding * 2,
            // ignore: missing_required_param
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
                    children: [
                      const CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.call,
                            size: 14,
                            color: primaryColor,
                          )),
                      const SizedBox(
                        width: defaultPadding / 2,
                      ),
                      const Text('+1 212-673-3754',
                          style: TextStyle(color: Colors.white)),
                      const VerticalDivider(
                        color: Colors.white,
                        width: defaultPadding * 2,
                      ),
                      const CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.alt_route,
                            size: 16,
                            color: primaryColor,
                          )),
                      const SizedBox(
                        width: defaultPadding / 2,
                      ),
                      Text(
                        Values.direction.tr,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
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
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(restaurant.name,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
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
              Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * 0.55,
                    vertical: defaultPadding * 0.2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    color: primaryColor,
                  ),
                  child: Text(
                    '1.2 km',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                  )),
              const Spacer(),
              RatingChip(
                rating: restaurant.totalRating,
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Text(
            restaurant.address,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: secondaryTextColor),
          ),
          const SizedBox(
            height: defaultPadding / 3,
          ),
          RichText(
            text: TextSpan(
                text: Values.open_now.tr,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.green),
                children: [
                  TextSpan(
                    text: ' ' + Values.daily_time.tr,
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
