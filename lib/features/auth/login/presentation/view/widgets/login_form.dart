import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import 'do_not_have_an_account_widget.dart';
import 'remember_me_and_forget_password_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: LocaleKeys.Authentication_Email.tr(),
                  hintText: LocaleKeys.Authentication_EnterYourEmail.tr(),
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: LocaleKeys.Authentication_Password.tr(),
                  hintText: LocaleKeys.Authentication_EnterYourPassword.tr(),
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              const RememberMeAndForgetPasswordWidget(),
              const SizedBox(
                height: 48.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(LocaleKeys.Authentication_Login.tr()),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const DonotHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
