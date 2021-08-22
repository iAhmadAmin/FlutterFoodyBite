import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:foodybite/view/widgets/rating_bar.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:foodybite/view/widgets/search_field.dart';
import 'package:get/get.dart';

class NewReviewPage extends StatefulWidget {
  const NewReviewPage({
    this.isUpdate = false,
  });
  final bool isUpdate;

  @override
  _NewReviewPageState createState() => _NewReviewPageState();
}

class _NewReviewPageState extends State<NewReviewPage> {
  final _experienceController = TextEditingController();
  final _searchController = TextEditingController();
  Restaurant _restaurant;
  bool restSelected = false;

  @override
  Widget build(BuildContext context) {
    if (_searchController.text.length > 0) {
      try {
        _restaurant = restaurantList.firstWhere(
          (r) => r.name.toLowerCase().trim().contains(
                _searchController.text.toLowerCase().trim(),
              ),
        );
      } catch (e) {
        _restaurant = null;
      }
    }

    return Scaffold(
        appBar: MAppBar(
          title: widget.isUpdate ? Values.edit_review.tr : Values.new_review.tr,
          appBar: AppBar(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    Values.post.tr,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SizedBox.expand(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              SearchField(
                controller: _searchController,
                hint: Values.search_restaurants.tr,
                onFieldSubmitted: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: defaultPadding),
              _searchController.text.isNotEmpty
                  ? _restaurant == null
                      ? Text('No Restaurant with name: '
                          '${_searchController.text}, try searching again')
                      : RestaurantTile(
                          closeTap: () {
                            setState(() {
                              _restaurant = null;
                              _searchController.clear();
                              restSelected = false;
                            });
                          },
                          forAddReview: true,
                          selectedForReview: restSelected,
                          restaurant: _restaurant,
                          addReviewTap: restSelected
                              ? () {}
                              : () {
                                  setState(() {
                                    restSelected = true;
                                  });
                                },
                        )
                  : const SizedBox(),
              const SizedBox(height: defaultPadding * 2),
              Text(Values.ratings.tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              const SizedBox(height: defaultPadding),
              RatingBar(initialRating: 0, onRatingChange: (val) {}),
              const SizedBox(height: defaultPadding * 1),
              Text(Values.rate_your_experience.tr,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              const SizedBox(height: defaultPadding * 2),
              Text(Values.review.tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: InputField(
                  maxLines: 8,
                  isWhite: false,
                  hint: Values.write_your_experience.tr,
                  controller: _experienceController,
                ),
              ),
              if (widget.isUpdate)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      defaultPadding, defaultPadding * 3, defaultPadding, 0),
                  child: MButton(
                    label: Values.update.tr,
                    onTap: () {},
                  ),
                ),
              const SizedBox(height: defaultPadding * 6),
            ],
          ),
        )));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
