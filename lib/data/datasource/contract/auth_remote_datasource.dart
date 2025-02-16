import '../../../domain/core/api_result.dart';
import '../../../domain/entities/forget_password_entity.dart';

abstract class AuthRemoteDatasource {
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email);
}
