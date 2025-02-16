import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/datasource/contract/auth_local_datasource.dart';
import 'package:online_exam_app/data/datasource/contract/auth_remote_datasource.dart';
import '../../domain/core/api_result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
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
}
