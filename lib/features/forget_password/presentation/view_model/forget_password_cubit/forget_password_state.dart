part of 'forget_password_cubit.dart';

class ForgetPasswordState {
  final BaseState baseState;

  ForgetPasswordState({required this.baseState});

  ForgetPasswordState copyWith({BaseState? baseState}) {
    return ForgetPasswordState(
      baseState: baseState ?? this.baseState,
    );
  }
}

// actions
sealed class ForgetPasswordAction {}

final class FormDataChangedAction extends ForgetPasswordAction {}

final class OtpRequestAction extends ForgetPasswordAction {}
