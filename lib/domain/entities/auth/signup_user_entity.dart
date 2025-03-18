class SignupUserEntity {
  final String email;

  final String password;

  final String firstName;

  final String lastName;

  final String confirmPassword;

  final String phone;

  final String username;

  SignupUserEntity({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.confirmPassword,
    required this.phone,
    required this.username,
  });
}
