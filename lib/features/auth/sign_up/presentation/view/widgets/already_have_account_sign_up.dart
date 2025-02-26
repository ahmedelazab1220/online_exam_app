import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/navigation/routes.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';

class AlreadyHaveAccountSignUp extends StatelessWidget {
  const AlreadyHaveAccountSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: LocaleKeys.Authentication_AlreadyHaveAnAccount.tr(),
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: LocaleKeys.Authentication_Login.tr(),
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // just for test when add viewModel i'll remove it.
                Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
              },
          ),
        ],
      ),
    );
  }
}
