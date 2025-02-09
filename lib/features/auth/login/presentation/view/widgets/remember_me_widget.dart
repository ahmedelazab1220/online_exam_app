import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
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
          onPressed: () {},
          child: Text(context.forgotPassword),
        ),
      ],
    );
  }
}
