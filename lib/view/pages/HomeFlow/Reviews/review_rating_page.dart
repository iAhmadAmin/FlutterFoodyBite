import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/review_tile.dart';

class ReviewRatingPage extends StatelessWidget {
  const ReviewRatingPage({
    @required this.showMyRatings,
  });

  final bool showMyRatings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: 'Review & Ratings',
        appBar: AppBar(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, color: kSecondaryColor),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: reviewList.length,
          itemBuilder: (_, index) => ReviewTile(
            isRestaurant: showMyRatings,
            review: reviewList[index],
          ),
        ),
      ),
    );
  }
}
