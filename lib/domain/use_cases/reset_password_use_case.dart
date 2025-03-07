import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/repositories/auth_repository.dart';

import '../core/api_result.dart';
import '../entities/reset_password_entity.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  ResetPasswordUseCase(this._authRepository);

  Future<Result<ResetPasswordEntity>> call({
    required String email,
    required String newPassword,
  }) async =>
      await _authRepository.resetPassword(
        email: email,
        newPassword: newPassword,
      );
}
