import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isExistBackButton;
  final String? title;
  final Color? color;

  const CustomAppBar({
    super.key,
    this.isExistBackButton = false,
    this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      leading: isExistBackButton
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new),
            )
          : null,
      title: title != null
          ? Padding(
              padding: EdgeInsets.only(left: isExistBackButton ? 0 : 16.0),
              child: Text(
                title!,
                style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                      color: color,
                    ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
