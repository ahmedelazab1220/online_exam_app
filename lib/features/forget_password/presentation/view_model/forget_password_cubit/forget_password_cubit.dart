import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/di/di.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/providers/user_session_provider.dart';
import '../../../../../core/utils/validation/validator.dart';
import '../../../../../domain/core/api_result.dart';
import '../../../../../domain/entities/auth/forget_password_entity.dart';
import '../../../../../domain/use_cases/forget_password_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final Validator validator;

  ForgetPasswordCubit(this.forgetPasswordUseCase, this.validator)
      : super(ForgetPasswordState(baseState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  ValueNotifier<bool> valid = ValueNotifier(false);

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }

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
    }
  }

  void _forgetPassword() async {
    if (formKey.currentState!.validate()) {
      final userSessionProvider = getIt<UserSessionProvider>();
      userSessionProvider.email = emailController.text;
      emit(state.copyWith(baseState: BaseLoadingState()));
      final response = await forgetPasswordUseCase(email: emailController.text);
      emit(ForgetPasswordState(baseState: BaseHideLoadingState()));
      switch (response) {
        case SuccessResult<ForgetPasswordEntity>():
          {
            emit(state.copyWith(baseState: BaseSuccessState()));
          }
        case FailureResult<ForgetPasswordEntity>():
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
    if (emailController.text.isNotEmpty && formKey.currentState!.validate()) {
      valid.value = true;
    } else {
      valid.value = false;
    }
  }
}
