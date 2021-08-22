import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/review_model.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    @required this.review,
    this.isRestaurant = false,
  });
  final Review review;
  final bool isRestaurant;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
      padding: const EdgeInsets.only(
        bottom: defaultPadding * 1,
        top: defaultPadding / 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(
                isRestaurant ? review.restaurantImgPath : review.userImgPath),
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isRestaurant ? review.restaurantName : review.userName,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Spacer(),
                    RatingChip(rating: review.rating),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Text(
                  review.review,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: secondaryTextColor,
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

class RatingChip extends StatelessWidget {
  const RatingChip({
    @required this.rating,
  });
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ratingBarColor,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            size: 18,
            color: ratingStarColor,
          ),
          const SizedBox(width: 4),
          Text(
            rating.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
