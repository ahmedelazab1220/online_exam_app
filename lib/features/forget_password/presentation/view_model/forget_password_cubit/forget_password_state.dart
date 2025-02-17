part of 'forget_password_cubit.dart';

// states
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordSuccessState extends ForgetPasswordState {}

// to remove the loading dialog
class HideLoadingState extends ForgetPasswordState {}

final class ForgetPasswordFailureState extends ForgetPasswordState {
  String message;

  ForgetPasswordFailureState(this.message);
}

final class ForgetPasswordLoadingState extends ForgetPasswordState {}

final class NavigateToOtpScreenState extends ForgetPasswordState {}

final class NavigateToLoginScreenState extends ForgetPasswordState {}

class InvalidEmailState extends ForgetPasswordState {}

// actions
sealed class ForgetPasswordAction {}

final class NavigateToOtpScreenAction extends ForgetPasswordAction {}

final class NavigateToLoginScreenAction extends ForgetPasswordAction {}

final class FormDataChangedAction extends ForgetPasswordAction {}

final class OtpRequestAction extends ForgetPasswordAction {}
