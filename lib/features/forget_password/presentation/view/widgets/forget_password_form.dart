import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<ForgetPasswordCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          onChanged: () => viewModel.doIntent(FormDataChangedAction()),
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.Authentication_ForgetPassword.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      LocaleKeys.Authentication_PleaseEnterYourEmail.tr(),
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
                validator: (value) =>
                    viewModel.validator.validateEmail(value ?? ""),
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.Authentication_Email.tr(),
                  hintText: LocaleKeys.Authentication_EnterYourEmail.tr(),
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ValueListenableBuilder(
                valueListenable: viewModel.valid,
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () => viewModel.doIntent(OtpRequestAction()),
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
