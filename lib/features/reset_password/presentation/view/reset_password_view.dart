import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/di/di.dart';
import '../../../../core/navigation/routes.dart';
import '../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import '../view_model/reset_password_cubit/reset_password_cubit.dart';
import 'widgets/reset_password_form.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPasswordCubit viewModel = getIt.get<ResetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
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
          if (state.baseState is BaseSuccessState) {
            Navigator.pushNamed(context, AppRoutes.loginRoute);
          }
          if (state.baseState is BaseErrorState) {
            AppDialogs.showFailureDialog(
              context,
              message: (state.baseState as BaseErrorState).errorMessage,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.Authentication_Password.tr()),
          ),
          body: ResetPasswordForm(),
        ),
      ),
    );
  }
}
