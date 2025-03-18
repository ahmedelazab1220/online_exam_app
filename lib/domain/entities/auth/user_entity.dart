class UserEntity {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? username;
  final String? role;
  final String? createdAt;
  final bool? isVerified;

  UserEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.username,
    this.createdAt,
    this.isVerified,
    this.role,
  });
}
