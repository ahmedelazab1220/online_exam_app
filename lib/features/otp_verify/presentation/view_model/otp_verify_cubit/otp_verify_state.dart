part of 'otp_verify_cubit.dart';

class OtpVerifyState extends Equatable {
  final BaseState baseState;
  final BaseState? otpResendState;

  const OtpVerifyState({
    required this.baseState,
    this.otpResendState,
  });

  OtpVerifyState copyWith({
    BaseState? baseState,
    BaseState? otpResendState,
  }) {
    return OtpVerifyState(
      baseState: baseState ?? this.baseState,
      otpResendState: otpResendState ?? this.otpResendState,
    );
  }

  @override
  List<Object> get props => [baseState, otpResendState ?? []];
}

sealed class OtpVerifyAction {}

final class FormDataChangedAction extends OtpVerifyAction {}

final class OtpResendAction extends OtpVerifyAction {}

final class OnCompleteCodeVerifyAction extends OtpVerifyAction {}

final class EnterOtpAction extends OtpVerifyAction {
  final int index;
  final String otpCode;

  EnterOtpAction({
    required this.index,
    required this.otpCode,
  });
}
