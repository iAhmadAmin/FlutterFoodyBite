import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/view/widgets/review_tile.dart';

class ReviewRatingPage extends StatelessWidget {
  const ReviewRatingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Review & Ratings',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: reviewList.length,
          itemBuilder: (_, index) => ReviewTile(review: reviewList[index]),
        ),
      ),
    );
  }
}
