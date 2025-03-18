import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/models/auth/login/request/login_user_request_dto.dart';
import 'package:online_exam_app/data/api/models/auth/reset_password/request/reset_password_request_dto.dart';
import 'package:online_exam_app/data/api/models/auth/signup/request/signup_request_dto.dart';
import 'package:online_exam_app/data/api/models/auth/signup/response/signup_response_dto.dart';
import 'package:online_exam_app/domain/entities/auth/authentication_response.dart';
import 'package:online_exam_app/domain/entities/auth/reset_password_entity.dart';
import '../../../domain/core/api_result.dart';
import '../../../domain/entities/auth/forget_password_entity.dart';
import '../../api/api_manager.dart';
import '../../api/auth/auth_retrofit_client.dart';
import '../../api/models/auth/forget_password/request/forget_password_request_dto.dart';
import '../../api/models/auth/verify_otp_code/request/verify_otp_code_request_dto.dart';
import '../../api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';
import '../contract/auth_remote_datasource.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthRetrofitClient authRetrofitClient;
  final ApiManager apiManager;

  AuthRemoteDatasourceImpl(this.authRetrofitClient, this.apiManager);

  @override
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email) async {
    final response = await apiManager.execute<ForgetPasswordEntity>(
      () async {
        final response = await authRetrofitClient
            .forgetPassword(ForgetPasswordRequestDto(email: email));
        return response.toDomain();
      },
    );
    return response;
  }

  @override
  Future<Result<VerifyOtpCodeResponseDto>> verifyOtp(String otpCode) async {
    final response = await apiManager.execute<VerifyOtpCodeResponseDto>(
      () async {
        final response = await authRetrofitClient
            .verifyOtp(VerifyOtpCodeRequestDto(otpCode: otpCode));
        return response;
      },
    );
    return response;
  }

  @override
  Future<Result<ResetPasswordEntity>> resetPassword(
      ResetPasswordRequestDto resetPasswordRequestDto) async {
    final response = await apiManager.execute<ResetPasswordEntity>(
      () async {
        final response = await authRetrofitClient.resetPassword(
          resetPasswordRequestDto,
        );
        return response.toDomain();
      },
    );
    return response;
  }

  @override
  Future<Result<SignupResponseDto>> signup(SignupRequestDto request) async {
    final response = await apiManager.execute<SignupResponseDto>(
      () async {
        final response = await authRetrofitClient.signup(request);
        return response;
      },
    );
    return response;
  }

  @override
  Future<Result<AuthenticationResponse>> login(LoginUserRequestDto request) {
    final response = apiManager.execute<AuthenticationResponse>(
      () async {
        final response = await authRetrofitClient.login(request);
        return response.toDomain();
      },
    );
    return response;
  }
}
