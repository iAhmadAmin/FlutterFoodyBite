import 'package:flutter/cupertino.dart';

enum FCategory {
  Italian,
  Chinese,
  American,
  Indian,
  Thai,
  Korean,
  Arabian,
  Maxian,
}

class Restaurant {
  Restaurant({
    @required this.address,
    @required this.category,
    @required this.imagePath,
    @required this.isOpen,
    @required this.name,
    @required this.rating,
  });

  String name, address, imagePath;
  FCategory category;
  double rating;
  bool isOpen;
}
