import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utils/validation/validator.dart';
import 'package:online_exam_app/domain/core/api_result.dart';
import 'package:online_exam_app/domain/entities/forget_password_entity.dart';

import '../../../../../domain/use_case/forget_password_use_case.dart';
part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final Validator validator = Validator();

  ForgetPasswordCubit(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  ValueNotifier<bool> valid = ValueNotifier(false);

  void doIntent(ForgetPasswordAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case OtpRequestAction():
        {
          _forgetPassword();
        }
      case NavigateToOtpScreenAction():
        {
          _navigateToOtpScreen();
        }
      case NavigateToLoginScreenAction():
        {
          _navigateToLoginScreen();
        }
    }
  }

  void _forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      var response = await forgetPasswordUseCase(email: emailController.text);
      emit(HideLoadingState());
      switch (response) {
        case SuccessResult<ForgetPasswordEntity>():
          {
            emit(ForgetPasswordSuccessState());
          }
        case FailureResult<ForgetPasswordEntity>():
          {
            emit(ForgetPasswordFailureState(response.exception.toString()));
          }
      }
    }
  }

  void _updateValidationState() {
    if (emailController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _navigateToOtpScreen() {
    emit(NavigateToOtpScreenState());
  }

  void _navigateToLoginScreen() {
    emit(NavigateToLoginScreenState());
  }
}
