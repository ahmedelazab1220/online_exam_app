import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.login),
      ),
      body: LoginForm(),
    );
  }
}
