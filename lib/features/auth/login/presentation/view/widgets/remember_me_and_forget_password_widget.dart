import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/navigation/navigation_manager.dart';
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
          side: Theme.of(context).checkboxTheme.side,
        ),
        Text(
          context.rememberMe,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            NavigationManager.push(AppRoutes.forgetPasswordRoute);
          },
          style: Theme.of(context).textButtonTheme.style?.copyWith(
                foregroundColor: WidgetStatePropertyAll(AppColors.black),
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
          child: Text(context.forgotPassword),
        )
      ],
    );
  }
}
