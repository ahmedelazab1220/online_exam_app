// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_code_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpCodeRequestDto _$VerifyOtpCodeRequestDtoFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpCodeRequestDto(
      otpCode: json['resetCode'] as String?,
    );

Map<String, dynamic> _$VerifyOtpCodeRequestDtoToJson(
        VerifyOtpCodeRequestDto instance) =>
    <String, dynamic>{
      'resetCode': instance.otpCode,
    };
