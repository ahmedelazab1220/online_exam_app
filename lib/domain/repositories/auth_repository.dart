import '../../data/api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';
import '../core/api_result.dart';
import '../entities/forget_password_entity.dart';

abstract class AuthRepository {
  Future<Result<ForgetPasswordEntity>> forgetPassword({
    required String email,
  });

  Future<Result<VerifyOtpCodeResponseDto>> verifyOtpCode({
    required String otpCode,
  });
}
