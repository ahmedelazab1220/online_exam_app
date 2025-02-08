import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/navigation/navigation_manager.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(onPressed: () {
          NavigationManager.goBack();
        }, icon: Icon(Icons.arrow_back_ios, color: AppColors.black,)),
        SizedBox(width: 8,),
        Text(title, style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,

        ),)
      ],
    );
  }
}
