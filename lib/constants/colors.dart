import 'package:flutter/material.dart';
import 'package:foodybite/models/restaurant_model.dart';

// Single Colors
const primaryColor = Color(0xFF5663FF);
const secondaryColor = Color(0xFF6E7FAA);
const textColor = Color(0xFF222455);
final secondaryTextColor = const Color(0xFF6E7FAA).withOpacity(0.8);
final textFieldColor = Colors.white.withOpacity(0.25);
final backgroundColor = Colors.grey[50];
const appBarColor = Colors.white;
const ratingBarColor = Color(0xFFF6FBFF);
const ratingStarColor = Color(0xFFffcc00);

// Food Category Gradients
const italianGradient = LinearGradient(colors: [
  Color(0xFFFF5673),
  Color(0xFFFF8C48),
]);
const chineseGradient = LinearGradient(colors: [
  Color(0xFF832BF6),
  Color(0xFFFF4665),
]);
const maxicanGradient = LinearGradient(colors: [
  Color(0xFF2DCEF8),
  Color(0xFF3B40FE),
]);
const thaiGradient = LinearGradient(colors: [
  Color(0xFF009DC5),
  Color(0xFF21E590),
]);

const arabianGradient = LinearGradient(colors: [
  Color(0xFFFF870E),
  Color(0xFFD236D2),
]);
const indianGradient = LinearGradient(colors: [
  Color(0xFFFE327E),
  Color(0xFF5C51FF),
]);
const americanGradient = LinearGradient(colors: [
  Color(0xFF2CE3F1),
  Color(0xFF6143FF),
]);
const korianGradient = LinearGradient(colors: [
  Color(0xFFFF5673),
  Color(0xFFFF8C48),
]);

LinearGradient getCategoryGradient(FCategory category) {
  switch (category) {
    case FCategory.American:
      return americanGradient;
    case FCategory.Arabian:
      return arabianGradient;
    case FCategory.Chinese:
      return chineseGradient;
    case FCategory.Indian:
      return indianGradient;
    case FCategory.Italian:
      return italianGradient;
    case FCategory.Korean:
      return korianGradient;
    case FCategory.Maxian:
      return maxicanGradient;
    case FCategory.Thai:
      return thaiGradient;
    default:
      return italianGradient;
  }
}
