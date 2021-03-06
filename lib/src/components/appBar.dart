import 'package:flutter/material.dart';
import 'constants.dart';
import 'customText.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Widget widget;

  const CustomAppBar({Key key, this.text, this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: CustomText(
          color: Colors.white,
          sizes: Sizes.title,
          text: text,
        ),
        actions: [widget],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
