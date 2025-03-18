import 'package:online_exam_app/domain/entities/auth/user_entity.dart';

class AuthenticationResponse {
  final String? token;
  final UserEntity? user;
  final String? message;

  AuthenticationResponse({this.token, this.user, this.message});
}
