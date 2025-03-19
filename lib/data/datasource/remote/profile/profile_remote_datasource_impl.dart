import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/models/profile/user_data/response/profile_data_response_dto.dart';
import 'package:online_exam_app/domain/core/api_result.dart';
import '../../../../core/utils/constants.dart';
import '../../../api/api_manager.dart';
import '../../../api/profile/profile_retrofit_client.dart';
import '../../contract/profile/profile_data_remote_datasource.dart';

@Injectable(as: ProfileRemoteDatasource)

class ProfileRemoteDataSourceImpl implements ProfileRemoteDatasource{

  final ProfileRetrofitClient profileRetrofitClient;
  final ApiManager apiManager;
  final FlutterSecureStorage secureStorage;

  ProfileRemoteDataSourceImpl(this.profileRetrofitClient,this.apiManager,this.secureStorage);

  @override
  Future<Result<ProfileDataResponseDto>> getProfileData(String token) async {
    //
    // final token = await secureStorage.read(key: Constants.token);
    //    print('token is $token');
    // if (token == null || token.isEmpty) {
    //   print(" ERROR: Token is null or empty!");
    //   return FailureResult(Exception("Token is missing"));
    // }

    final response = await apiManager.execute<ProfileDataResponseDto>(
          () async {
        return await profileRetrofitClient.getProfileData(token);
      },
    );

    return response;
  }



}