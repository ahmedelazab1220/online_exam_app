import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../api_constants.dart';
import '../models/auth/forget_password/request/forget_password_request_dto.dart';
import '../models/auth/forget_password/response/forget_password_response_dto.dart';
import '../models/auth/reset_password/request/reset_password_request_dto.dart';
import '../models/auth/reset_password/response/reset_password_response_dto.dart';
import '../models/auth/verify_otp_code/request/verify_otp_code_request_dto.dart';
import '../models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';

part 'auth_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;

  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponseDto> forgetPassword(
    @Body() ForgetPasswordRequestDto request,
  );

  @POST(ApiConstants.verifyOtpCodeRoute)
  Future<VerifyOtpCodeResponseDto> verifyOtp(
    @Body() VerifyOtpCodeRequestDto request,
  );

  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponseDto> resetPassword(
    @Body() ResetPasswordRequestDto request,
  );
}
