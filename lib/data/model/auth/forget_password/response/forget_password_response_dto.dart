import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/forget_password_entity.dart';

part 'forget_password_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "code")
  final num? code;

  ForgetPasswordResponseDto({
    this.message,
    this.code,
  });

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseDtoToJson(this);

  ForgetPasswordEntity toDomain() => ForgetPasswordEntity(
        message: message,
        code: code?.toInt(),
      );
}
