// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataResponseDto _$ProfileDataDtoFromJson(Map<String, dynamic> json) =>
    ProfileDataResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ProfileDataDtoToJson(ProfileDataResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'user': instance.user,
    };
