import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_state.dart';
import 'package:online_exam_app/core/utils/validation/validator.dart';
import 'package:online_exam_app/domain/entities/auth/authentication_response.dart';
import 'package:online_exam_app/domain/use_cases/login_use_case.dart';

import '../../../../../../core/navigation/routes.dart';
import '../../../../../../domain/core/api_result.dart';
import '../../../../../../domain/entities/auth/login_user_entity.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final Validator validator;

  LoginCubit(this.loginUseCase, this.validator)
      : super(LoginState(baseState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> valid = ValueNotifier(false);

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    valid.dispose();
    return super.close();
  }

  void doIntent(LoginAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case LoginRequestAction():
        {
          _login();
        }
      case NavigateToSignupScreenAction():
        {
          _navigateToSignupScreen();
        }
      case NavigateToForgetPasswordScreenAction():
        {
          _navigateToForgotPasswordScreen();
        }
    }
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final response = await loginUseCase.call(
          loginUserEntity: LoginUserEntity(
        email: emailController.text,
        password: passwordController.text,
      ));
      emit(state.copyWith(baseState: BaseHideLoadingState()));
      switch (response) {
        case SuccessResult<AuthenticationResponse>():
          {
            emit(state.copyWith(baseState: BaseSuccessState()));
          }
        case FailureResult<AuthenticationResponse>():
          {
            emit(
              state.copyWith(
                baseState: BaseErrorState(
                    errorMessage: response.exception.toString(),
                    exception: response.exception),
              ),
            );
          }
      }
    }
  }

  void _updateValidationState() {
    if (formKey.currentState!.validate()) {
      valid.value = true;
    } else {
      valid.value = false;
    }
  }

  void _navigateToSignupScreen() {
    emit(state.copyWith(baseState: BaseNavigationState(AppRoutes.signUpRoute)));
  }

  void _navigateToForgotPasswordScreen() {
    emit(state.copyWith(
        baseState: BaseNavigationState(AppRoutes.forgetPasswordRoute)));
  }
}
