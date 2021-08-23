import 'package:flutter/cupertino.dart';
import 'package:foodybite/models/review_model.dart';

enum FCategory {
  italian,
  chinese,
  american,
  indian,
  thai,
  korean,
  arabian,
  mexican,
}

class Restaurant {
  Restaurant({
    @required this.address,
    @required this.category,
    @required this.displayFoodImg,
    @required this.isOpen,
    @required this.name,
    @required this.totalRating,
    @required this.reviews,
    @required this.foodImages,
  });

  String name, address, displayFoodImg;
  FCategory category;
  double totalRating;
  List<Review> reviews;
  bool isOpen;
  List<String> foodImages;
}
