import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/navigation/routes.dart';
import 'package:online_exam_app/core/utils/validation/validator.dart';
import 'package:online_exam_app/domain/entities/auth/signup_user_entity.dart';
import 'package:online_exam_app/domain/use_cases/signup_use_case.dart';

import '../../../../../../core/base/base_state.dart';
import '../../../../../../domain/core/api_result.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;
  final Validator validator;

  SignupCubit(this.signupUseCase, this.validator)
      : super(SignupState(baseState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  ValueNotifier<bool> valid = ValueNotifier(false);

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    valid.dispose();
    return super.close();
  }

  void doIntent(SignupAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case SignupRequestAction():
        {
          _signup();
        }
      case NavigateToLoginScreenAction():
        {
          _navigateToLoginScreen();
        }
    }
  }

  void _signup() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final response = await signupUseCase.call(
          signupUserEntity: SignupUserEntity(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phone: phoneNumberController.text,
        username: usernameController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
      ));
      emit(state.copyWith(baseState: BaseHideLoadingState()));
      switch (response) {
        case SuccessResult<void>():
          {
            emit(state.copyWith(baseState: BaseSuccessState()));
          }
        case FailureResult<void>():
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

  void _navigateToLoginScreen() {
    emit(state.copyWith(baseState: BaseNavigationState(AppRoutes.loginRoute)));
  }
}
