part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BaseState? baseState;

  const LoginState({this.baseState});

  LoginState copyWith({BaseState? baseState}) {
    return LoginState(baseState: baseState ?? this.baseState);
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class LoginAction {}

final class FormDataChangedAction extends LoginAction {}

final class LoginRequestAction extends LoginAction {}

final class NavigateToSignupScreenAction extends LoginAction {}

final class NavigateToForgetPasswordScreenAction extends LoginAction {}
