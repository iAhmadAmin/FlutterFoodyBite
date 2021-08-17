import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/review_model.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({@required this.review});
  final Review review;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding),
      padding: const EdgeInsets.only(bottom: kPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(review.userImgPath),
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
                      review.userName,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
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
                      review.rating.toString(),
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
                  review.review,
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
