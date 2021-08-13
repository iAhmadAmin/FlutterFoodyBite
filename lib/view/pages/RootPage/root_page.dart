import 'package:flutter/material.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/view/pages/HomeFlow/Home/home_page.dart';
import 'package:foodybite/view/pages/RootPage/Components/bootm_nav_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _pages = const [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            _pages[_selectedIndex],
            Positioned(
              bottom: 0,
              child: BottomNavigation(
                onCenterTap: () {
                  setState(() {
                    _selectedIndex = _selectedIndex == 2 ? 0 : 2;
                  });
                },
                selectedIndex: _selectedIndex,
                onItemPressed: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                centerIcon: _selectedIndex == 2 ? Icons.close : Icons.add,
                iconsPath: [
                  _selectedIndex == 0 ? MIcons.home_f : MIcons.home_o,
                  _selectedIndex == 1 ? MIcons.bookmark_f : MIcons.bookmark_o,
                  _selectedIndex == 3 ? MIcons.bell_f : MIcons.bell_o,
                  _selectedIndex == 4 ? MIcons.user_f : MIcons.user_o,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
