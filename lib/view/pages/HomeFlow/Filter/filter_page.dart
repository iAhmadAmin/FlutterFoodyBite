import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/rating_bar.dart';
import 'package:foodybite/view/widgets/round_button.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  FCategory selectedCategory = FCategory.Italian;
  double _sliderValue = 10;
  int _rating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: 'Filter',
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
            const SizedBox(
              height: defaultPadding * 1.5,
            ),
            const Text('Select Category',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(
              height: defaultPadding * 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Wrap(
                spacing: defaultPadding,
                runSpacing: defaultPadding / 2,
                children: FCategory.values.map((c) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = c;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius / 2),
                        gradient: selectedCategory == c
                            ? getCategoryGradient(c)
                            : null,
                        border: selectedCategory != c
                            ? Border.all(
                                color: secondaryColor,
                                width: 0.2,
                              )
                            : null,
                      ),
                      height: 42,
                      width: getRelativeWidth(0.25),
                      child: Center(
                        child: Text(
                          c.toString().split('.').last,
                          style: TextStyle(
                            color: c == selectedCategory
                                ? Colors.white
                                : secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            const Text('Distance',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(
              height: defaultPadding,
            ),
            SizedBox(
              height: 50,
              width: getRelativeWidth(1),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  tickMarkShape: SliderTickMarkShape.noTickMark,
                  activeTrackColor: primaryColor,
                  inactiveTrackColor: primaryColor.withOpacity(0.2),
                  thumbColor: primaryColor,
                  valueIndicatorColor: primaryColor,
                  trackHeight: 6,
                  // thumbShape: const SliderThumbShape(
                  //   thumbHeight: 40,
                  //   min: 0,
                  //   max: 10,
                  //   thumbRadius: 20,
                  // ),
                ),
                child: Slider(
                    label: _sliderValue.round().toString(),
                    value: _sliderValue,
                    max: 100,
                    divisions: 20,
                    onChanged: (val) {
                      setState(() {
                        _sliderValue = val;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(color: ktextColor),
                  ),
                  Text(
                    '100',
                    style: TextStyle(color: ktextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            const Text('Ratings',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            RatingBar(
              onRatingChange: (val) {
                print(val);
              },
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: RoundButton(
                    onTap: () {},
                    label: 'Reset',
                    rightRound: false,
                  ),
                ),
                const VerticalDivider(
                  color: Colors.white,
                  width: 0.5,
                ),
                Expanded(
                  child: RoundButton(
                    onTap: () {},
                    label: 'Apply',
                    leftRound: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
