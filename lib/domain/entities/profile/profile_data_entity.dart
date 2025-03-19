import '../auth/user_entity.dart';

class ProfileDataEntity {
  final String? message;
  final String? code;
  final UserEntity? user;


  ProfileDataEntity({
    this.message,
    this.code,
    this.user
  });
}
