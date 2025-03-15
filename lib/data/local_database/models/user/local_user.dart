import 'package:hive/hive.dart';
import 'package:online_exam_app/domain/entities/user_entity.dart';

import '../../../api/models/auth/user/user_dto.dart';

part 'local_user.g.dart';

@HiveType(typeId: 0)
class LocalUser {
  @HiveField(0)
  final String? email;
  @HiveField(1)
  final String? firstName;
  @HiveField(2)
  final String? lastName;
  @HiveField(3)
  final String? phone;
  @HiveField(4)
  final String? username;
  @HiveField(5)
  final String? role;
  @HiveField(6)
  final String? createdAt;
  @HiveField(7)
  final bool? isVerified;
  @HiveField(8)
  final String? id;

  LocalUser({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.createdAt,
    required this.isVerified,
    required this.role,
    required this.id,
  });

  factory LocalUser.fromDataSource(UserDto userDto) {
    return LocalUser(
      email: userDto.email,
      firstName: userDto.firstName,
      lastName: userDto.lastName,
      phone: userDto.phone,
      username: userDto.username,
      createdAt: userDto.createdAt,
      isVerified: userDto.isVerified,
      role: userDto.role,
      id: userDto.id,
    );
  }

  UserEntity toDomain() {
    return UserEntity(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      username: username,
      createdAt: createdAt,
      isVerified: isVerified,
      role: role,
    );
  }
}
