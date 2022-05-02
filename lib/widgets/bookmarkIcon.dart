import 'package:flutter/material.dart';

class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon(
      {Key? key,
      required this.scaffoldKey,
      required this.iconSize,
      this.iconColor,
      this.normalIconColor})
      : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final double iconSize;
  final Color? iconColor;
  final Color? normalIconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.all(0),
        constraints: BoxConstraints(),
        alignment: Alignment.centerRight,
        icon: Icon(Icons.favorite_border,
            color: normalIconColor == null ? Colors.grey : normalIconColor),
        onPressed: () {});
  }
}
