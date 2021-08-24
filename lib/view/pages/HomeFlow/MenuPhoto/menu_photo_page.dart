import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/models/data.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/view/pages/HomeFlow/PhotoView/photo_view_page.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:get/get.dart';

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
      appBar: MAppBar(
        title: Values.menu_n_photos.tr,
        appBar: AppBar(),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: foodsImgList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => PhotoViewPage(
                      index: index,
                    ));
              },
              child: Hero(
                tag: foodsImgList[index],
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  child: Image.asset(
                    foodsImgList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) => _tileCounts[index % 10],
          mainAxisSpacing: defaultPadding / 2,
          crossAxisSpacing: defaultPadding / 2,
        ),
      ),
    );
  }
}
