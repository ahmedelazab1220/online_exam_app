import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';

import '../../domain/core/api_result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/repositories/auth_repository.dart';
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
    var response = await authRemoteDatasource.forgetPassword(email);
    return response;
  }

  @override
  Future<Result<VerifyOtpCodeResponseDto>> verifyOtpCode({
    required String otpCode,
  }) async {
    var response = await authRemoteDatasource.verifyOtp(otpCode);
    return response;
  }
}
