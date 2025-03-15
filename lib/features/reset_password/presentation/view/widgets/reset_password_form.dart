import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<ResetPasswordCubit>(context);
    return SingleChildScrollView(
      child: Form(
        onChanged: () => viewModel.doIntent(FormDataChangedAction()),
        key: viewModel.formKey,
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
              const SizedBox(
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
              const SizedBox(
                height: 32.0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: viewModel.passwordController,
                validator: (value) =>
                    viewModel.validator.validatePassword(value ?? ""),
                decoration: InputDecoration(
                  labelText: LocaleKeys.Authentication_NewPassword.tr(),
                  hintText: LocaleKeys.Authentication_EnterYourPassword.tr(),
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: viewModel.confirmPasswordController,
                validator: (value) =>
                    viewModel.validator.validateConfirmPassword(
                  value ?? "",
                  viewModel.passwordController.text,
                ),
                decoration: InputDecoration(
                  labelText: LocaleKeys.Authentication_ConfirmPassword.tr(),
                  hintText: LocaleKeys.Authentication_ConfirmPassword.tr(),
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              const SizedBox(
                height: 48.0,
              ),
              ValueListenableBuilder(
                valueListenable: viewModel.valid,
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () =>
                      viewModel.doIntent(ResetPasswordSubmittedAction()),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: value
                        ? AppColors.blue
                        : AppColors.black[AppColors.colorCode30],
                  ),
                  child: Text(LocaleKeys.Authentication_Continue.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
