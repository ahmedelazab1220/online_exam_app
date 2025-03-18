import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import 'do_not_have_an_account_widget.dart';
import 'remember_me_and_forget_password_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<LoginCubit>(context);
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
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    viewModel.validator.validateEmail(value ?? ""),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: viewModel.passwordController,
                validator: (value) =>
                    viewModel.validator.validatePassword(value ?? ""),
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
              ValueListenableBuilder(
                valueListenable: viewModel.valid,
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () => viewModel.doIntent(LoginRequestAction()),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    backgroundColor: value
                        ? AppColors.blue
                        : AppColors.black[AppColors.colorCode30],
                  ),
                  child: Text(LocaleKeys.Authentication_Login.tr()),
                ),
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
