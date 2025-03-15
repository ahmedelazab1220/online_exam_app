// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestDto _$SignupRequestDtoFromJson(Map<String, dynamic> json) =>
    SignupRequestDto(
      email: json['email'] as String,
      password: json['password'] as String,
      confirmPassword: json['rePassword'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$SignupRequestDtoToJson(SignupRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.confirmPassword,
      'phone': instance.phone,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
