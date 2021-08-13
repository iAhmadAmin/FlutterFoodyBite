import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/utils/size_config.dart';

class BottomNavigation extends StatelessWidget {
  final List<String> iconsPath;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  final VoidCallback onCenterTap;
  const BottomNavigation({
    Key key,
    @required this.iconsPath,
    @required this.onCenterTap,
    @required this.centerIcon,
    @required this.selectedIndex,
    @required this.onItemPressed,
  }) : assert(iconsPath.length != 3, "Item must equal 4");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: getRelativeHeight(0.09),
      width: SizeConfig.screenWidth,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: getRelativeHeight(0.065),
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    iconPath: iconsPath[0],
                    selectedIndex: selectedIndex,
                    index: 0,
                  ),
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    iconPath: iconsPath[1],
                    selectedIndex: selectedIndex,
                    index: 1,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.14,
                  ),
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    iconPath: iconsPath[2],
                    selectedIndex: selectedIndex,
                    index: 3,
                  ),
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    iconPath: iconsPath[3],
                    selectedIndex: selectedIndex,
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: onCenterTap,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                        color: kPrimaryColor.withOpacity(0.75),
                      ),
                      // BoxShadow(
                      //   blurRadius: 25,
                      //   offset: Offset(0, 5),
                      //   color: kPrimaryColor.withOpacity(0.75),
                      // )
                    ],
                    color: kPrimaryColor,
                  ),
                  height: getRelativeWidth(0.135),
                  width: getRelativeWidth(0.135),
                  child: Center(
                      child: Icon(
                    centerIcon,
                    color: Colors.white,
                    size: getRelativeWidth(0.07),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key key,
    @required this.onItemPressed,
    @required this.iconPath,
    @required this.index,
    @required this.selectedIndex,
  }) : super(key: key);

  final Function(int p1) onItemPressed;
  final String iconPath;
  final int index, selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemPressed(index);
      },
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.18,
        child: SvgPicture.asset(
          iconPath,
          height: 20,
          color: index == selectedIndex ? kPrimaryColor : kSecondaryColor,
        ),
      ),
    );
  }
}
