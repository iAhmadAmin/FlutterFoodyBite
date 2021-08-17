import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/utils/size_config.dart';

class MenuPhotoPage extends StatelessWidget {
  const MenuPhotoPage({Key key}) : super(key: key);

  final _tileCounts = const [
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(3, 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Menu & Photos',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding,
        ),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: 22,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Image.asset(
                Images.food,
                fit: BoxFit.cover,
              ),
            );
          },
          staggeredTileBuilder: (int index) => _tileCounts[index % 10],
          mainAxisSpacing: kPadding / 2,
          crossAxisSpacing: kPadding / 2,
        ),
      ),
    );
  }
}
