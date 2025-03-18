// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserResponseDto _$LoginUserResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LoginUserResponseDto(
      message: json['message'] as String?,
      token: json['token'] as String?,
      userDto: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginUserResponseDtoToJson(
        LoginUserResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.userDto,
    };
