part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final BaseState baseState;

  const ResetPasswordState({
    required this.baseState,
  });

  ResetPasswordState copyWith({
    BaseState? baseState,
  }) {
    return ResetPasswordState(
      baseState: baseState ?? this.baseState,
    );
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class ResetPasswordAction {}

final class FormDataChangedAction extends ResetPasswordAction {}

final class ResetPasswordSubmittedAction extends ResetPasswordAction {}
