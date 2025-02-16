import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import '../../../../core/di/di.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/utils/dialogs/app_dialogs.dart';
import '../view_model/forget_password_cubit/forget_password_cubit.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  // field injection
  ForgetPasswordCubit viewModel = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => viewModel,
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            AppDialogs.showLoadingDialog(
              context,
              message: context.loading,
            );
          }
          if (state is ForgetPasswordSuccessState) {
            AppDialogs.showSuccessDialog(
              context,
              message: context.otpSentToYourEmail,
              nextAction: () {
                viewModel.doIntent(NavigateToOtpScreenAction());
              },
            );
          }
          if (state is HideLoadingState) {
            // to remove the loading dialog
            Navigator.pop(context);
          }
          if (state is InvalidEmailState) {
            AppDialogs.showFailureDialog(
              context,
              message: context.emailNotValid,
            );
          }
          if (state is ForgetPasswordFailureState) {
            AppDialogs.showFailureDialog(
              context,
              message: state.message,
              nextAction: () {
                Navigator.pop(context);
                viewModel.doIntent(OtpRequestAction());
              },
              nextActionTitle: context.retry,
            );
          }
          if (state is NavigateToOtpScreenState) {
            // i'll remove it when add otpVerifyView
            log('message: NavigateToOtpScreenState');
          }
          if (state is NavigateToLoginScreenState) {
            Navigator.pop(context, AppRoutes.loginRoute);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.password),
            leading: InkWell(
              onTap: () {
                viewModel.doIntent(NavigateToLoginScreenAction());
              },
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: ForgetPasswordForm(),
        ),
      ),
    );
  }
}
