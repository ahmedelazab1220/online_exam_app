import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'do_not_have_an_account_widget.dart';
import 'remember_me_and_forget_password_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: context.email,
                  hintText: context.enterYourEmail,
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: context.password,
                    hintText: context.enterYourPassword,
                  ),
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                ),
              ),
              RememberMeAndForgetPasswordWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 48.0, bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(context.login),
                ),
              ),
              DonotHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
