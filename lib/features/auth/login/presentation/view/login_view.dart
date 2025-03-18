import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/navigation/routes.dart';
import 'package:online_exam_app/features/auth/login/presentation/view_model/login_cubit/login_cubit.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/dialogs/app_dialogs.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import 'widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginCubit viewModel = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<LoginCubit, LoginState>(
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
            Navigator.pushReplacementNamed(context, AppRoutes.bottomNavBar);
          }
          if (state.baseState is BaseNavigationState) {
            Navigator.pushReplacementNamed(
                context, (state.baseState as BaseNavigationState).route);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.Authentication_Login.tr()),
          ),
          body: const LoginForm(),
        ),
      ),
    );
  }
}
