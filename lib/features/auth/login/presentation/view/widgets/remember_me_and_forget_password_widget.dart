import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/navigation/routes.dart';

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
          context.rememberMe,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            // just for test when add viewModel i'll remove it.
            Navigator.pushNamed(context, AppRoutes.forgetPasswordRoute);
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.black,
            padding: EdgeInsets.zero,
          ),
          child: Text(context.forgotPassword),
        )
      ],
    );
  }
}
