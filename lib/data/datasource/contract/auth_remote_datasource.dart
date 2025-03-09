import '../../../domain/core/api_result.dart';
import '../../../domain/entities/forget_password_entity.dart';
import '../../../domain/entities/reset_password_entity.dart';
import '../../api/models/auth/reset_password/request/reset_password_request_dto.dart';
import '../../api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';

abstract class AuthRemoteDatasource {
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email);

  Future<Result<VerifyOtpCodeResponseDto>> verifyOtp(String otpCode);

  Future<Result<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  );
}
