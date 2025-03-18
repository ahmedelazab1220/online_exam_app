import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/domain/entities/auth/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto({
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserEntity toDomain() {
    return UserEntity(
      email: email,
      username: username,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
      isVerified: isVerified,
      id: id,
      createdAt: createdAt,
    );
  }
}
