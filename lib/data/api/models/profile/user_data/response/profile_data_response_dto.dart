import 'package:json_annotation/json_annotation.dart';
import '../../../../../../domain/entities/profile/profile_data_entity.dart';
import '../../../auth/user/user_dto.dart';
part 'profile_data_dto.g.dart';

@JsonSerializable()
class ProfileDataResponseDto {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "code")
  final String? code;

  @JsonKey(name: "user")
  final UserDto? user;

  ProfileDataResponseDto({this.message, this.user, this.code});

  factory ProfileDataResponseDto.fromJson(Map<String, dynamic> json) => _$ProfileDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataDtoToJson(this);
  ProfileDataEntity toDomain() => ProfileDataEntity(
    message: message,
    code:  code,
    user: user!.toDomain()
  );
}


