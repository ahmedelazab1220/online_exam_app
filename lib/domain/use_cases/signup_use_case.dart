import 'package:injectable/injectable.dart';

import '../core/api_result.dart';
import '../entities/signup_user_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Result<void>> call(
      {required SignupUserEntity signupUserEntity}) async {
    return await repository.signup(signupUserEntity: signupUserEntity);
  }
}
