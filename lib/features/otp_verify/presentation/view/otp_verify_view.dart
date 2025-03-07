import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/assets/app_colors.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/di/di.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../core/utils/dialogs/app_toasts.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../view_model/otp_verify_cubit/otp_verify_cubit.dart';
import 'widgets/otp_verify_form.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({super.key});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  OtpVerifyCubit viewModel = getIt.get<OtpVerifyCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<OtpVerifyCubit, OtpVerifyState>(
        listener: (context, state) {
          if (state.baseState is BaseLoadingState ||
              state.otpResendState is BaseLoadingState) {
            AppDialogs.showLoadingDialog(
              context,
              message: LocaleKeys.Loading.tr(),
            );
          }
          if (state.baseState is BaseHideLoadingState ||
              state.otpResendState is BaseHideLoadingState) {
            // to remove the loading dialog
            Navigator.pop(context);
          }
          if (state.baseState is BaseSuccessState) {
            Navigator.pushNamed(context, AppRoutes.resetPasswordRoute);
          }
          if (state.baseState is BaseErrorState) {
            final errorMessage =
                (state.baseState as BaseErrorState).errorMessage;

            // Show toast ONLY if the error message is NOT "Reset code is invalid or has expired"
            if (errorMessage !=
                LocaleKeys.Error_OtpCodeIsInvalidOrExpired.tr()) {
              showToast(
                title: errorMessage,
                color: AppColors.red,
              );
            }
          }
          if (state.otpResendState is BaseSuccessState) {
            showToast(
              title: LocaleKeys.Messages_OtpSentToYourEmail.tr(),
              color: AppColors.blue,
            );
          }
          if (state.otpResendState is BaseErrorState) {
            showToast(
              title: (state.otpResendState as BaseErrorState).errorMessage,
              color: AppColors.red,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.Authentication_Password.tr()),
          ),
          body: OtpVerifyForm(),
        ),
      ),
    );
  }
}
