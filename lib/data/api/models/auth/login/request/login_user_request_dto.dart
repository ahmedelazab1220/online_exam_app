import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/auth/login_user_entity.dart';

part 'login_user_request_dto.g.dart';

@JsonSerializable()
class LoginUserRequestDto {
  final String? email;
  final String? password;

  LoginUserRequestDto({
    this.email,
    this.password,
  });

  factory LoginUserRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginUserRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserRequestDtoToJson(this);

  factory LoginUserRequestDto.fromDomain(LoginUserEntity loginUserEntity) =>
      LoginUserRequestDto(
          email: loginUserEntity.email, password: loginUserEntity.password);
}
