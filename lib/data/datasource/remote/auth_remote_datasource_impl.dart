import 'package:injectable/injectable.dart';
import '../../../domain/core/api_result.dart';
import '../../../domain/entities/forget_password_entity.dart';
import '../../api/api_manager.dart';
import '../../api/auth/auth_retrofit_client.dart';
import '../../model/auth/forget_password/request/forget_password_request_dto.dart';
import '../contract/auth_remote_datasource.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final AuthRetrofitClient authRetrofitClient;
  final ApiManager apiManager;

  AuthRemoteDatasourceImpl(this.authRetrofitClient, this.apiManager);

  @override
  Future<Result<ForgetPasswordEntity>> forgetPassword(String email) async {
    var response = await apiManager.execute<ForgetPasswordEntity>(
      () async {
        var response = await authRetrofitClient
            .forgetPassword(ForgetPasswordRequestDto(email: email));
        return response.toDomain();
      },
    );
    return response;
  }
}
