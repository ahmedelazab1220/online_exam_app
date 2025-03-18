// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserRequestDto _$LoginUserRequestDtoFromJson(Map<String, dynamic> json) =>
    LoginUserRequestDto(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginUserRequestDtoToJson(
        LoginUserRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
