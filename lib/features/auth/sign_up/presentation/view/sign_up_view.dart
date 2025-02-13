import 'package:flutter/material.dart';
import 'package:online_exam_app/core/shared_widgets/custom_app_bar.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.signUp),
      body: SignUpForm(),
    );
  }
}
