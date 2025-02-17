import '../core/api_result.dart';
import '../entities/forget_password_entity.dart';

abstract class AuthRepository {
  Future<Result<ForgetPasswordEntity>> forgetPassword({
    required String email,
  });
}
