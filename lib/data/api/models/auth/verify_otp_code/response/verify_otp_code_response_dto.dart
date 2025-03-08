import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_code_response_dto.g.dart';

@JsonSerializable()
class VerifyOtpCodeResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;

  VerifyOtpCodeResponseDto({this.status, this.message});

  factory VerifyOtpCodeResponseDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpCodeResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyOtpCodeResponseDtoToJson(this);
  }
}
