import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/navigation/routes.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';

class RememberMeAndForgetPasswordWidget extends StatefulWidget {
  const RememberMeAndForgetPasswordWidget({super.key});

  @override
  State<RememberMeAndForgetPasswordWidget> createState() =>
      _RememberMeAndForgetPasswordWidgetState();
}

class _RememberMeAndForgetPasswordWidgetState
    extends State<RememberMeAndForgetPasswordWidget> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isRememberMe,
          onChanged: (value) {
            isRememberMe = value!;
            setState(() {});
          },
        ),
        Text(
          LocaleKeys.Authentication_RememberMe.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // just for test when add viewModel i'll remove it.
            Navigator.pushNamed(context, AppRoutes.forgetPasswordRoute);
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.black,
            padding: EdgeInsets.zero,
          ),
          child: Text(LocaleKeys.Authentication_ForgetPassword.tr()),
        )
      ],
    );
  }
}
