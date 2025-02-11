import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

import '../../../../../../core/assets/app_colors.dart';

class AlreadyHaveAccountSignUp extends StatelessWidget {
  const AlreadyHaveAccountSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return   RichText(
      text: TextSpan(
        text: context.alreadyHaveAnAccount,
        style:  Theme.of(context).textTheme.titleMedium,
        children: [
          TextSpan(
            text: context.login,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.blue, // Make it look like a link
              fontWeight: FontWeight.bold,
            ),
            // Add a tap event
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint("Navigate to Login Screen");
              },
          ),
        ],
      ),
    );
  }
}
