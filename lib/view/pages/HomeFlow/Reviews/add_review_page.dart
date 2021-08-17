import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: const Text(
            'Review & Ratings',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close, color: kSecondaryColor),
            )
          ],
        ),
        body: SizedBox.expand(
            child: Column(
          children: [
            const SizedBox(height: kPadding * 2),
            RatingBar(onRatingChange: (val) {}),
            const SizedBox(height: kPadding * 1),
            Text('Rate your experience',
                style: TextStyle(
                  color: kSecondaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(height: kPadding * 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: InputField(
                maxLines: 8,
                isWhite: false,
                hint: 'Write your experience',
                controller: _experienceController,
              ),
            ),
            const Spacer(),
            RoundButton(
              label: 'Done',
              onTap: () {},
            ),
          ],
        )));
  }
}
