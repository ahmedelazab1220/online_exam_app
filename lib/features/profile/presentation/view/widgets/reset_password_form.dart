import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

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
                hintText: LocaleKeys.Authentication_currentPassword.tr(),
                labelText: LocaleKeys.Authentication_currentPassword.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_NewPassword.tr(),
                labelText: LocaleKeys.Authentication_NewPassword.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_ConfirmPassword.tr(),
                labelText: LocaleKeys.Authentication_ConfirmPassword.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.Profile_Update.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
