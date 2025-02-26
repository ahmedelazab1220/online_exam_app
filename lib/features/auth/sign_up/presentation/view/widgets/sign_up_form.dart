import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import 'already_have_account_sign_up.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_EnterYourUserName.tr(),
                labelText: LocaleKeys.Authentication_UserName.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                spacing: 16.0,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: LocaleKeys.Authentication_EnterFirstName.tr(),
                        labelText: LocaleKeys.Authentication_FirstName.tr(),
                      ),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: LocaleKeys.Authentication_EnterLastName.tr(),
                        labelText: LocaleKeys.Authentication_LastName.tr(),
                      ),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_EnterYourEmail.tr(),
                labelText: LocaleKeys.Authentication_Email.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                spacing: 16.0,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText:
                            LocaleKeys.Authentication_EnterYourPassword.tr(),
                        labelText: LocaleKeys.Authentication_Password.tr(),
                      ),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText:
                            LocaleKeys.Authentication_ConfirmPassword.tr(),
                        labelText:
                            LocaleKeys.Authentication_ConfirmPassword.tr(),
                      ),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  )
                ],
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_EnterPhoneNumber.tr(),
                labelText: LocaleKeys.Authentication_PhoneNumber.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.Authentication_SignUp.tr()),
            ),
            SizedBox(
              height: 16.0,
            ),
            AlreadyHaveAccountSignUp(),
          ],
        ),
      ),
    );
  }
}
