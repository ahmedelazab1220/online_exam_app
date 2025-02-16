import 'package:injectable/injectable.dart';

import '../core/api_result.dart';
import '../entities/forget_password_entity.dart';
import '../repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<Result<ForgetPasswordEntity>> call({required String email}) async {
    return await repository.forgetPassword(email: email);
  }
}
