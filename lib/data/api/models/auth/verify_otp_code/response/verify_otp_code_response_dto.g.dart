// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_code_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpCodeResponseDto _$VerifyOtpCodeResponseDtoFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpCodeResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$VerifyOtpCodeResponseDtoToJson(
        VerifyOtpCodeResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
