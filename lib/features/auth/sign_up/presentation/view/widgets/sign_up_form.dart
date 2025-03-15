import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/signup_cubit/signup_cubit.dart';
import 'already_have_account_sign_up.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<SignupCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          onChanged: () => viewModel.doIntent(FormDataChangedAction()),
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    viewModel.validator.validateName(value ?? ""),
                controller: viewModel.usernameController,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.validator.validateName(value ?? ""),
                        controller: viewModel.firstNameController,
                        decoration: InputDecoration(
                          hintText:
                              LocaleKeys.Authentication_EnterFirstName.tr(),
                          labelText: LocaleKeys.Authentication_FirstName.tr(),
                        ),
                        onTapOutside: (_) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.validator.validateName(value ?? ""),
                        controller: viewModel.lastNameController,
                        decoration: InputDecoration(
                          hintText:
                              LocaleKeys.Authentication_EnterLastName.tr(),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    viewModel.validator.validateEmail(value ?? ""),
                controller: viewModel.emailController,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.validator.validatePassword(value ?? ""),
                        controller: viewModel.passwordController,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            viewModel.validator.validateConfirmPassword(
                          value ?? "",
                          viewModel.passwordController.text,
                        ),
                        controller: viewModel.confirmPasswordController,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    viewModel.validator.validatePhoneNumber(value ?? ""),
                controller: viewModel.phoneNumberController,
                decoration: InputDecoration(
                  hintText: LocaleKeys.Authentication_EnterPhoneNumber.tr(),
                  labelText: LocaleKeys.Authentication_PhoneNumber.tr(),
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
                  onPressed: () => viewModel.doIntent(SignupRequestAction()),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: value
                        ? AppColors.blue
                        : AppColors.black[AppColors.colorCode30],
                  ),
                  child: Text(LocaleKeys.Authentication_SignUp.tr()),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const AlreadyHaveAccountSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
