import 'package:injectable/injectable.dart';

import '../../data/api/models/auth/verify_otp_code/response/verify_otp_code_response_dto.dart';
import '../core/api_result.dart';
import '../repositories/auth_repository.dart';

@injectable
class OtpVerifyUseCase {
  final AuthRepository repository;

  OtpVerifyUseCase({required this.repository});

  Future<Result<VerifyOtpCodeResponseDto>> call(
      {required String otpCode}) async {
    return await repository.verifyOtpCode(otpCode: otpCode);
  }
}
