import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar({
    @required this.title,
    @required this.appBar,
    this.actions,
    this.bgColor,
    this.txtColor,
  });

  final String title;
  final AppBar appBar;
  final List<Widget> actions;
  final Color bgColor, txtColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor ?? appBarColor,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: txtColor ?? Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: txtColor ?? Colors.black,
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
