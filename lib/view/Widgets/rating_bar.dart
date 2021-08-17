import 'package:flutter/material.dart';
import 'package:foodybite/constants/consts.dart';

class RatingBar extends StatefulWidget {
  const RatingBar({@required this.onRatingChange});
  final ValueChanged<int> onRatingChange;
  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int _rating = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding,
        vertical: kPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius / 2),
        color: Colors.grey[100],
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
                color: i <= _rating ? Colors.yellow[700] : Colors.grey[300],
                size: 52,
              ),
            ),
        ],
      ),
    );
  }
}
