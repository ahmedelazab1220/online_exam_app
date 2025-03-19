import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
            radius: 40,
            child: Image.asset(
              'assets/images/Person_image.png',
              width: 81,
              height: 81,
              fit: BoxFit.contain,
            )),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.blue[AppColors.colorCode30],
                  borderRadius: BorderRadius.circular(6)),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
