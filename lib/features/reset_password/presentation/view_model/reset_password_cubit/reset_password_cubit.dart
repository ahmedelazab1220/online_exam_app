import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/base/base_state.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/providers/user_session_provider.dart';
import '../../../../../core/utils/validation/validator.dart';
import '../../../../../domain/core/api_result.dart';
import '../../../../../domain/entities/reset_password_entity.dart';
import '../../../../../domain/use_cases/reset_password_use_case.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  final Validator validator;

  ResetPasswordCubit(this.resetPasswordUseCase, this.validator)
      : super(ResetPasswordState(baseState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  ValueNotifier<bool> valid = ValueNotifier(false);

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    valid.dispose();
    return super.close();
  }

  void doIntent(ResetPasswordAction action) {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case ResetPasswordAction():
        {
          _resetPassword();
        }
    }
  }

  void _resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(baseState: BaseLoadingState()));
      final userSessionProvider = getIt<UserSessionProvider>();
      final response = await resetPasswordUseCase(
        email: userSessionProvider.email,
        newPassword: passwordController.text,
      );
      emit(ResetPasswordState(baseState: BaseHideLoadingState()));
      switch (response) {
        case SuccessResult<ResetPasswordEntity>():
          {
            emit(state.copyWith(baseState: BaseSuccessState()));
          }
        case FailureResult<ResetPasswordEntity>():
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
    if (passwordController.text.isNotEmpty &&
        confirmPasswordController.text == passwordController.text &&
        formKey.currentState!.validate()) {
      valid.value = true;
    } else {
      valid.value = false;
    }
  }
}
