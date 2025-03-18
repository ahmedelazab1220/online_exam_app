import 'package:online_exam_app/domain/entities/auth/authentication_response.dart';
import 'package:online_exam_app/domain/entities/auth/login_user_entity.dart';
import 'package:online_exam_app/domain/entities/auth/reset_password_entity.dart';

import '../../data/api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';
import '../core/api_result.dart';
import '../entities/auth/forget_password_entity.dart';
import '../entities/auth/signup_user_entity.dart';

abstract class AuthRepository {
  Future<Result<ForgetPasswordEntity>> forgetPassword({
    required String email,
  });

  Future<Result<VerifyOtpCodeResponseDto>> verifyOtpCode({
    required String otpCode,
  });

  Future<Result<ResetPasswordEntity>> resetPassword({
    required String email,
    required String newPassword,
  });

  Future<Result<void>> signup({
    required SignupUserEntity signupUserEntity,
  });

  Future<Result<AuthenticationResponse>> login({
    required LoginUserEntity loginUserEntity,
  });
}
