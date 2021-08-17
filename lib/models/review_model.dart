import 'package:flutter/cupertino.dart';

class Review {
  Review({
    @required this.rating,
    @required this.userImgPath,
    @required this.userName,
    @required this.review,
    @required this.restaurantName,
    @required this.restaurantImgPath,
  });

  final String userName, userImgPath, review, restaurantName, restaurantImgPath;
  final int rating;
}
