import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/api_result.dart';
import 'package:online_exam_app/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/domain/repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository repository;
  ForgetPasswordUseCase({required this.repository});

  Future<Result<ForgetPasswordEntity>> call({required String email}) async {
    return await repository.forgetPassword(email: email);
  }
}
