import 'package:json_annotation/json_annotation.dart';

import '../../user/user_dto.dart';

part 'signup_response_dto.g.dart';

@JsonSerializable()
class SignupResponseDto {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'user')
  final UserDto? userDto;

  SignupResponseDto({
    this.message,
    this.token,
    this.userDto,
  });

  factory SignupResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseDtoToJson(this);
}
