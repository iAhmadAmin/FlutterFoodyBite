import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:foodybite/view/widgets/rating_bar.dart';
import 'package:foodybite/view/widgets/restaurant_tile.dart';
import 'package:foodybite/view/widgets/search_field.dart';

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

  @override
  Widget build(BuildContext context) {
    if (_searchController.text.length > 0) {
      try {
        _restaurant =
            restaurantList.firstWhere((r) => r.name == _searchController.text);
      } catch (e) {
        _restaurant = null;
      }
    }

    return Scaffold(
        appBar: MAppBar(
          title: widget.isUpdate ? 'Edit Review' : 'New Review',
          appBar: AppBar(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Post',
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
                hint: 'Search Restaurant',
                onFieldSubmitted: (value) {
                  setState(() {});
                  print(value);
                  print('controller text: ' + _searchController.text);
                },
              ),
              const SizedBox(height: defaultPadding),
              _searchController.text.isNotEmpty
                  ? _restaurant == null
                      ? Text('No Restaurant with name: '
                          '${_searchController.text}, try searching again')
                      : RestaurantTile(
                          forAddReview: true, restaurant: _restaurant)
                  : const SizedBox(),
              const SizedBox(height: defaultPadding * 2),
              const Text('Ratings',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              const SizedBox(height: defaultPadding),
              RatingBar(onRatingChange: (val) {}),
              const SizedBox(height: defaultPadding * 1),
              Text('Rate your experience',
                  style: TextStyle(
                    color: ktextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              const SizedBox(height: defaultPadding * 2),
              const Text('Review',
                  style: TextStyle(
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
                  hint: 'Write your experience',
                  controller: _experienceController,
                ),
              ),
              if (widget.isUpdate)
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      defaultPadding, defaultPadding * 3, defaultPadding, 0),
                  child: MButton(
                    label: 'Update',
                    onTap: () {},
                  ),
                ),
              const SizedBox(height: defaultPadding * 4),
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
