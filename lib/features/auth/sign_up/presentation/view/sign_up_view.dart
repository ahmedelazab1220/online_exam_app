import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../view_model/signup_cubit/signup_cubit.dart';
import 'widgets/sign_up_form.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignupCubit viewModel = getIt<SignupCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<SignupCubit, SignupState>(
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
            );
          }
          if (state.baseState is BaseSuccessState) {
            Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
          }
          if (state.baseState is BaseNavigationState) {
            Navigator.pushReplacementNamed(
                context, (state.baseState as BaseNavigationState).route);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.Authentication_SignUp.tr()),
          ),
          body: const SignUpForm(),
        ),
      ),
    );
  }
}
