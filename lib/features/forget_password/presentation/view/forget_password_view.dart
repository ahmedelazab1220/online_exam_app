import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import '../../../../core/shared_widgets/custom_app_bar.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.password,
        isExistBackButton: true,
      ),
      body: ForgetPasswordForm(),
    );
  }
}
