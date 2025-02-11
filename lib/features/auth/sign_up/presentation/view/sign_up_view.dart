import 'package:flutter/material.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody()
    );
  }
}
