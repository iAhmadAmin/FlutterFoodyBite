import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/images.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({Key key}) : super(key: key);

  @override
  _PhotoViewPageState createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {});
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF25262E),
        centerTitle: true,
        title: const Text(
          'Preview',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: [
                for (var i = 1; i <= 8; i++)
                  PhotoView(
                      backgroundDecoration: const BoxDecoration(
                        color: Color(0xFF25262E),
                      ),
                      imageProvider: AssetImage(Images.food))
              ],
            ),
            Positioned(
                bottom: kPadding,
                child: SizedBox(
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < 8; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: CircleAvatar(
                            radius: _currentPage == i ? 5 : 3,
                            backgroundColor: _currentPage == i
                                ? Colors.white
                                : Colors.transparent,
                            child: CircleAvatar(
                              radius: _currentPage == i ? 4 : 3,
                              backgroundColor: _currentPage == i
                                  ? kPrimaryColor
                                  : Colors.white24,
                            ),
                          ),
                        )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
