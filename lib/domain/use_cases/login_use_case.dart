import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/repositories/auth_repository.dart';

import '../core/api_result.dart';
import '../entities/auth/authentication_response.dart';
import '../entities/auth/login_user_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Result<AuthenticationResponse>> call({
    required LoginUserEntity loginUserEntity,
  }) async =>
      await _authRepository.login(loginUserEntity: loginUserEntity);
}
