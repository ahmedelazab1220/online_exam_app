import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/auth/authentication_response.dart';

import '../../user/user_dto.dart';

part 'login_user_response_dto.g.dart';

@JsonSerializable()
class LoginUserResponseDto {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'user')
  final UserDto? userDto;

  LoginUserResponseDto({
    this.message,
    this.token,
    this.userDto,
  });

  factory LoginUserResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseDtoToJson(this);

  AuthenticationResponse toDomain() {
    return AuthenticationResponse(
      message: message,
      token: token,
      user: userDto?.toDomain(),
    );
  }
}
