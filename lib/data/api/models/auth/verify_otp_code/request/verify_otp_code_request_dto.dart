import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_code_request_dto.g.dart';

@JsonSerializable()
class VerifyOtpCodeRequestDto {
  @JsonKey(name: "resetCode")
  final String? otpCode;

  VerifyOtpCodeRequestDto({
    this.otpCode,
  });

  factory VerifyOtpCodeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyOtpCodeRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyOtpCodeRequestDtoToJson(this);
  }
}
