import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/models/restaurant_model.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Filter',
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
            const SizedBox(
              height: kPadding,
            ),
            const Text('Select Category',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(
              height: kPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding,
              ),
              child: Wrap(
                spacing: kPadding,
                runSpacing: kPadding / 2,
                children: FCategory.values.map((c) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = c;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius / 2),
                        gradient: selectedCategory == c
                            ? getCategoryGradient(c)
                            : null,
                        border: selectedCategory != c
                            ? Border.all(
                                color: kSecondaryColor,
                                width: 0.2,
                              )
                            : null,
                      ),
                      height: 38,
                      width: getRelativeWidth(0.25),
                      child: Center(
                        child: Text(
                          c.toString().split('.').last,
                          style: TextStyle(
                            color: c == selectedCategory
                                ? Colors.white
                                : kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: kPadding * 2,
            ),
            const Text('Distance',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(
              height: kPadding / 2,
            ),
            SizedBox(
              height: 50,
              width: getRelativeWidth(1),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  tickMarkShape: SliderTickMarkShape.noTickMark,
                  activeTrackColor: kPrimaryColor,
                  inactiveTrackColor: Colors.grey[300],
                  thumbColor: kPrimaryColor,
                  valueIndicatorColor: kPrimaryColor,
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
                    min: 0,
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
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(color: kSecondaryTextColor),
                  ),
                  Text(
                    '100',
                    style: TextStyle(color: kSecondaryTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kPadding * 2,
            ),
            const Text('Ratings',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                )),
            const SizedBox(
              height: kPadding * 1.6,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding,
                vertical: kPadding / 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius / 2),
                color: Colors.grey[100],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 1; i <= 5; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _rating = i;
                        });
                      },
                      child: Icon(
                        Icons.star,
                        color: i <= _rating
                            ? Colors.yellow[700]
                            : Colors.grey[300],
                        size: 52,
                      ),
                    ),
                ],
              ),
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

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    @required this.label,
    @required this.onTap,
    this.rightRound = true,
    this.leftRound = true,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool rightRound, leftRound;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftRound ? 30 : 0),
            topRight: Radius.circular(rightRound ? 30 : 0),
          ),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
