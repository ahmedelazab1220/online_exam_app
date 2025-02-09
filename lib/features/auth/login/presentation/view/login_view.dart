import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'package:online_exam_app/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam_app/features/auth/login/presentation/view/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title:context.login,context),
      body: LoginBody(),
    );
  }
}