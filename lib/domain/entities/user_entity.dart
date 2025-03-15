class UserEntity {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? username;
  final String? role;
  final String? createdAt;
  final bool? isVerified;

  UserEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.username,
    required this.createdAt,
    required this.isVerified,
    required this.role,
  });
}
