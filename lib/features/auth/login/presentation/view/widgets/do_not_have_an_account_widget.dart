import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/navigation/routes.dart';

class DonotHaveAnAccountWidget extends StatelessWidget {
  const DonotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: context.donotHaveAnAccount,
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: context.signUp,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // just for test when add viewModel i'll remove it.
                Navigator.pushReplacementNamed(context, AppRoutes.signUpRoute);
              },
          ),
        ],
      ),
    );
  }
}
