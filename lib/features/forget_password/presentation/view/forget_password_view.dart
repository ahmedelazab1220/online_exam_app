import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/base/base_state.dart';
import '../../../../core/assets/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../core/utils/dialogs/app_toasts.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../view_model/forget_password_cubit/forget_password_cubit.dart';
import 'widgets/forget_password_form.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  ForgetPasswordCubit viewModel = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => viewModel,
      child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state.baseState is BaseLoadingState) {
            AppDialogs.showLoadingDialog(
              context,
              message: LocaleKeys.Loading.tr(),
            );
          }
          if (state.baseState is BaseHideLoadingState) {
            // to remove the loading dialog
            Navigator.pop(context);
          }
          if (state.baseState is BaseErrorState) {
            AppDialogs.showFailureDialog(
              context,
              message: (state.baseState as BaseErrorState).errorMessage,
              nextAction: () {
                Navigator.pop(context);
                viewModel.doIntent(OtpRequestAction());
              },
              nextActionTitle: LocaleKeys.Retry.tr(),
            );
          }
          if (state.baseState is BaseSuccessState) {
            showToast(
                title: LocaleKeys.Messages_OtpSentToYourEmail.tr(),
                color: AppColors.blue);
            Navigator.pushNamed(context, AppRoutes.otpVerifyRoute);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.Authentication_Password.tr()),
          ),
          body: ForgetPasswordForm(),
        ),
      ),
    );
  }
}
