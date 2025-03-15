part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final BaseState? baseState;

  const SignupState({
    this.baseState,
  });

  SignupState copyWith({
    BaseState? baseState,
  }) {
    return SignupState(
      baseState: baseState ?? this.baseState,
    );
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class SignupAction {}

final class FormDataChangedAction extends SignupAction {}

final class SignupRequestAction extends SignupAction {}

final class NavigateToLoginScreenAction extends SignupAction {}
