import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/providers/user_session_provider.dart';
import '../../../../../data/api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';
import '../../../../../domain/core/api_result.dart';
import '../../../../../domain/entities/auth/forget_password_entity.dart';
import '../../../../../domain/use_cases/forget_password_use_case.dart';
import '../../../../../domain/use_cases/otp_verify_use_case.dart';
part 'otp_verify_state.dart';

@injectable
class OtpVerifyCubit extends Cubit<OtpVerifyState> {
  final OtpVerifyUseCase otpVerifyUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  OtpVerifyCubit(this.otpVerifyUseCase, this.forgetPasswordUseCase)
      : super(OtpVerifyState(baseState: BaseInitialState()));

  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  final ValueNotifier<bool> valid = ValueNotifier<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    return super.close();
  }

  void doIntent(OtpVerifyAction action) async {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case OtpResendAction():
        {
          _resenOtp();
        }
      case OnCompleteCodeVerifyAction():
        {
          _verifyOtp();
        }
      case EnterOtpAction():
        {
          _changeFocus(action.index, action.otpCode);
        }
    }
  }

  void _changeFocus(int index, String value) {
    if (value.length == 1 && index < controllers.length - 1) {
      FocusScope.of(focusNodes[index].context!).nextFocus();
    } else if (value.isEmpty) {
      FocusScope.of(focusNodes[index].context!).previousFocus();
    } else if (value.length == 1 && index == controllers.length - 1) {
      FocusScope.of(focusNodes[index].context!).unfocus();
    }
  }

  void _resenOtp() async {
    emit(state.copyWith(otpResendState: BaseLoadingState()));
    final userSessionProvider = getIt<UserSessionProvider>();
    final response =
        await forgetPasswordUseCase(email: userSessionProvider.email);
    emit(state.copyWith(otpResendState: BaseHideLoadingState()));
    switch (response) {
      case SuccessResult<ForgetPasswordEntity>():
        {
          emit(state.copyWith(otpResendState: BaseSuccessState()));
        }
      case FailureResult<ForgetPasswordEntity>():
        {
          emit(
            state.copyWith(
              otpResendState: BaseErrorState(
                  errorMessage: response.exception.toString(),
                  exception: response.exception),
            ),
          );
        }
    }
  }

  void _verifyOtp() async {
    if (valid.value) {
      final enteredOtp = controllers.map((e) => e.text).join();
      emit(state.copyWith(baseState: BaseLoadingState()));
      final response = await otpVerifyUseCase(otpCode: enteredOtp);
      emit(OtpVerifyState(baseState: BaseHideLoadingState()));
      switch (response) {
        case SuccessResult<VerifyOtpCodeResponseDto>():
          {
            emit(state.copyWith(baseState: BaseSuccessState()));
          }
        case FailureResult<VerifyOtpCodeResponseDto>():
          {
            for (var controller in controllers) {
              controller.clear();
            }

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

  String? validateOtpfield(String value) {
    if (value.length == 1) {
      return null;
    }
    return "";
  }

  void _updateValidationState() {
    if (controllers.map((e) => e.text).join().isNotEmpty &&
        formKey.currentState!.validate()) {
      valid.value = true;
    } else {
      valid.value = false;
    }
  }
}
