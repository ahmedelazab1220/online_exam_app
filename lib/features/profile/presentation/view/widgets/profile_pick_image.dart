import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/assets/app_icons.dart';
import 'package:online_exam_app/core/assets/app_images.dart';

class ProfilePickImage extends StatelessWidget {
  const ProfilePickImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            child: Image.asset(AppImages.personImage),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.blue[30],
                borderRadius: BorderRadius.circular(6)
              ),
              child: SvgPicture.asset(AppIcons.cameraIcon)
            ),
          )
        ],
      ),
    );
  }
}
