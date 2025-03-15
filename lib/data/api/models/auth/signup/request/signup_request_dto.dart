import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/signup_user_entity.dart';

part 'signup_request_dto.g.dart';

@JsonSerializable()
class SignupRequestDto {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'rePassword')
  final String confirmPassword;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'firstName')
  final String firstName;

  @JsonKey(name: 'lastName')
  final String lastName;

  SignupRequestDto({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory SignupRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestDtoToJson(this);

  factory SignupRequestDto.fromDomain(SignupUserEntity signupUserEntity) =>
      SignupRequestDto(
        email: signupUserEntity.email,
        password: signupUserEntity.password,
        confirmPassword: signupUserEntity.confirmPassword,
        phone: signupUserEntity.phone,
        username: signupUserEntity.username,
        firstName: signupUserEntity.firstName,
        lastName: signupUserEntity.lastName,
      );
}
