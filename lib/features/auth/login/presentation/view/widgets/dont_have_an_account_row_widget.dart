import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class DontHaveAnAccountRowWidget extends StatelessWidget {
  const DontHaveAnAccountRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    RichText(
    text: TextSpan(
    text: context.dontHaveAnAccount,
      style:  Theme.of(context).textTheme.titleMedium,
      children: [
        TextSpan(
          text: context.signUp,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: AppColors.blue, // Make it look like a link
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    ),
      ],
    );
  }
}