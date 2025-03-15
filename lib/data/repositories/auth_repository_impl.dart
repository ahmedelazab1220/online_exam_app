import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utils/constants.dart';
import 'package:online_exam_app/data/api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';
import 'package:online_exam_app/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/domain/entities/signup_user_entity.dart';
import '../../domain/core/api_result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../api/models/auth/reset_password/request/reset_password_request_dto.dart';
import '../api/models/auth/signup/request/signup_request_dto.dart';
import '../datasource/contract/auth_local_datasource.dart';
import '../datasource/contract/auth_remote_datasource.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDatasource;
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl(this.authLocalDatasource, this.authRemoteDatasource);

  @override
  Future<Result<ForgetPasswordEntity>> forgetPassword({
    required String email,
  }) async {
    final response = await authRemoteDatasource.forgetPassword(email);
    return response;
  }

  @override
  Future<Result<VerifyOtpCodeResponseDto>> verifyOtpCode({
    required String otpCode,
  }) async {
    final response = await authRemoteDatasource.verifyOtp(otpCode);
    return response;
  }

  @override
  Future<Result<ResetPasswordEntity>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    final response = await authRemoteDatasource.resetPassword(
      ResetPasswordRequestDto(email: email, newPassword: newPassword),
    );
    if (response is SuccessResult<ResetPasswordEntity>) {
      if (response.data.token != null) {
        await authLocalDatasource.saveToken(
            Constants.token, response.data.token!);
      }
    }
    return response;
  }

  @override
  Future<Result<void>> signup({
    required SignupUserEntity signupUserEntity,
  }) async {
    final response = await authRemoteDatasource
        .signup(SignupRequestDto.fromDomain(signupUserEntity));
    return response;
  }
}
