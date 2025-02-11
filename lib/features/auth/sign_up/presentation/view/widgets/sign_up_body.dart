import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/navigation/navigation_manager.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

import 'custom_app_bar.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            CustomAppBar(title: context.signUp,),
          ],
        ),
      ),
    );
  }
}
