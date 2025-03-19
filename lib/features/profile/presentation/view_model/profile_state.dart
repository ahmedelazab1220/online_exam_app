
import 'package:equatable/equatable.dart';
import '../../../../core/base/base_state.dart';

class ProfileState extends Equatable {
  final BaseState? baseState;

  const ProfileState({
    this.baseState,
  });

  ProfileState copyWith({
    BaseState? baseState,
  }) {
    return ProfileState(
      baseState: baseState ?? this.baseState,
    );
  }

  @override
  List<Object?> get props => [baseState];
}

sealed class ProfileAction {}


final class GetDataAction extends ProfileAction {}
