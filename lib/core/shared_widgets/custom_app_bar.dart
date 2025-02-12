import 'package:flutter/material.dart';
import '../navigation/navigation_manager.dart';

AppBar buildAppBar(
  context, {
  bool isExistBackButton = false,
  String? title,
  Color? color,
}) {
  return AppBar(
    titleSpacing: 0.0,
    leading: isExistBackButton == true
        ? InkWell(
            onTap: () {
              NavigationManager.goBack();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
          )
        : null,
    title: title != null
        ? Padding(
            padding: EdgeInsets.only(left: isExistBackButton ? 0 : 16.0),
            child: Text(
              title,
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    color: color,
                  ),
            ),
          )
        : null,
  );
}
