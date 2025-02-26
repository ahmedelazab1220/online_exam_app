part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  final BaseState baseState;

  const ForgetPasswordState({required this.baseState});

  ForgetPasswordState copyWith({BaseState? baseState}) {
    return ForgetPasswordState(
      baseState: baseState ?? this.baseState,
    );
  }

  @override
  List<Object?> get props => [baseState];
}

// actions
sealed class ForgetPasswordAction {}

final class FormDataChangedAction extends ForgetPasswordAction {}

final class OtpRequestAction extends ForgetPasswordAction {}
