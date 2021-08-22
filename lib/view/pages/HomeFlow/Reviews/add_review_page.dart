import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/rating_bar.dart';
import 'package:foodybite/view/widgets/round_button.dart';
import 'package:get/get.dart';

class AddReviewPage extends StatefulWidget {
  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          title: Values.review_n_ratings.tr,
          appBar: AppBar(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: secondaryColor),
            ),
          ],
        ),
        body: SizedBox.expand(
            child: Column(
          children: [
            const SizedBox(height: defaultPadding * 2),
            RatingBar(initialRating: 0, onRatingChange: (val) {}),
            const SizedBox(height: defaultPadding * 1),
            Text(Values.rate_your_experience.tr,
                style: TextStyle(
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
            const SizedBox(height: defaultPadding * 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: InputField(
                maxLines: 8,
                isWhite: false,
                hint: Values.write_your_experience.tr,
                controller: _experienceController,
              ),
            ),
            const Spacer(),
            RoundButton(
              label: Values.done.tr,
              onTap: () {},
            ),
          ],
        )));
  }
}
