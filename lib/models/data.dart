import 'package:foodybite/constants/images.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/models/review_model.dart';

String r = 'It is a long established fact that a reader will be distracted'
    ' by the readable content of a page when looking at its layout. '
    'The point of using Lorem Ipsum is that it has a more-or-less normal '
    'distribution of letters';

List<Restaurant> restaurantList = [
  Restaurant(
    displayFoodImg: Images.f1,
    name: 'Happy Bones',
    totalRating: 4.5,
    address: '394 Broome St, New York, NY 10013, USA',
    isOpen: true,
    category: FCategory.Italian,
    reviews: reviewList,
    foodImages: foodsImgList,
  ),
  Restaurant(
    reviews: reviewList,
    foodImages: foodsImgList,
    displayFoodImg: Images.f2,
    name: 'Uncle Boons',
    totalRating: 4.3,
    address: '7 Spring St, New York, NY 10012, USA',
    isOpen: true,
    category: FCategory.Chinese,
  ),
  Restaurant(
    reviews: reviewList,
    foodImages: foodsImgList,
    displayFoodImg: Images.f3,
    name: 'Uncle Boons',
    totalRating: 4.2,
    address: '7 Spring St, New York, NY 10012, USA',
    isOpen: false,
    category: FCategory.Chinese,
  ),
];

List<Review> reviewList = [
  Review(
    rating: 4,
    userImgPath: Images.d1,
    userName: 'Patty Howard',
    review: r.substring(1, 80),
    restaurantImgPath: Images.f1,
    restaurantName: 'Happy Bones',
  ),
  Review(
    rating: 5,
    userImgPath: Images.d2,
    userName: 'Antonio Banks',
    review: r.substring(1, 120),
    restaurantImgPath: Images.f2,
    restaurantName: 'Uncle Boons',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d3,
    userName: 'Franklin Cox',
    review: r.substring(1, 200),
    restaurantImgPath: Images.f3,
    restaurantName: 'Cheesy Does It',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d4,
    userName: 'Kristopher Ward',
    review: r.substring(1, 120),
    restaurantImgPath: Images.f4,
    restaurantName: 'Work N\' Roll',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d5,
    userName: 'Christopher Jennings',
    review: r.substring(1, 60),
    restaurantImgPath: Images.f5,
    restaurantName: 'Wild Theme Cafe',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d6,
    userName: 'Roy Kim',
    review: r.substring(1, 90),
    restaurantImgPath: Images.f6,
    restaurantName: 'Work This Way',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d7,
    userName: 'Drew Willis',
    review: r.substring(1, 111),
    restaurantImgPath: Images.f7,
    restaurantName: '16 Handle',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d8,
    userName: 'Claude Torres',
    review: r.substring(1, 123),
    restaurantImgPath: Images.f8,
    restaurantName: 'Le Bernardin',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d9,
    userName: 'Angelo Jordan',
    review: r.substring(1, 99),
    restaurantImgPath: Images.f9,
    restaurantName: 'Healthy Wealthy',
  ),
  Review(
    rating: 4,
    userImgPath: Images.d10,
    userName: 'Cory Barber',
    review: r.substring(1, 166),
    restaurantImgPath: Images.f10,
    restaurantName: 'Green\'O Zoone',
  ),
];

List<String> foodsImgList = [
  Images.f1,
  Images.f2,
  Images.f3,
  Images.f4,
  Images.f5,
  Images.f6,
  Images.f7,
  Images.f8,
  Images.f9,
  Images.f10,
  Images.f11,
  Images.f12,
  Images.f13,
  Images.f14,
];
