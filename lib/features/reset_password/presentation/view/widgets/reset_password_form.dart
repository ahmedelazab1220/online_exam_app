import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                LocaleKeys.Authentication_ResetPassword.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.Authentication_PasswordRequirements.tr(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: LocaleKeys.Authentication_NewPassword.tr(),
                  hintText: LocaleKeys.Authentication_EnterYourPassword.tr(),
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              SizedBox(
                height: 24.0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: LocaleKeys.Authentication_ConfirmPassword.tr(),
                  hintText: LocaleKeys.Authentication_ConfirmPassword.tr(),
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              SizedBox(
                height: 48.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(14),
                  backgroundColor: AppColors.blue,
                ),
                child: Text(LocaleKeys.Authentication_Continue.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
