import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'package:online_exam_app/features/auth/login/presentation/view/widgets/dont_have_an_account_row_widget.dart';
import 'package:online_exam_app/features/auth/login/presentation/view/widgets/remember_me_widget.dart';

class LoginBody extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: context.email,
                  hintText: context.enterYourEmail,
                ),
              ),
              SizedBox(
                height: 20,),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: context.password,
                  hintText: context.enterYourPassword,
                ),
              ),
              RememberMeAndForgetPassword(),
              SizedBox(
                height: 50,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text(context.login),
                ),
              ),
              SizedBox(
                height: 4,),
              DontHaveAnAccountRowWidget()
            ],
          ),
        ),
      ),
    );
  }
}