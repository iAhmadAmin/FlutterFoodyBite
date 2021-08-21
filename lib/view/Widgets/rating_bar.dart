import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';

class RatingBar extends StatefulWidget {
  const RatingBar({
    @required this.onRatingChange,
    @required this.initialRating,
  });
  final ValueChanged<int> onRatingChange;
  final int initialRating;
  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int _rating = 0;

  @override
  void initState() {
    _rating = widget.initialRating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorderRadius / 2),
        color: ratingBarColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 1; i <= 5; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  _rating = i;
                  widget.onRatingChange(_rating);
                });
              },
              child: Icon(
                Icons.star,
                color: i <= _rating ? ratingStarColor : Colors.grey[300],
                size: 52,
              ),
            ),
        ],
      ),
    );
  }
}
