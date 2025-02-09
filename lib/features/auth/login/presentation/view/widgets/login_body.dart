import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'package:online_exam_app/features/auth/login/presentation/view/widgets/dont_have_an_account_row_widget.dart';
import 'package:online_exam_app/features/auth/login/presentation/view/widgets/remember_me_widget.dart';

class LoginBody extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginBody({super.key});
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email must not be empty";
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return "This Email is not valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password must not be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

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
                validator: validateEmail,
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
                validator: validatePassword,
              ),
              RememberMeAndForgetPassword(),
              SizedBox(
                height: 50,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  if( formKey.currentState!.validate() == true )
                  {
                   log("login success");
                  }
                  print("$passwordController");
                }, child:
                Text(context.login),
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