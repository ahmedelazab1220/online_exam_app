import 'package:injectable/injectable.dart';

import '../../domain/core/api_result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/contract/auth_local_datasource.dart';
import '../datasource/contract/auth_remote_datasource.dart';

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
