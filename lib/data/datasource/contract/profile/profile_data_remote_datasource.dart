

import '../../../../domain/core/api_result.dart';
import '../../../api/models/profile/user_data/response/profile_data_response_dto.dart';

abstract class ProfileRemoteDatasource {

  Future<Result<ProfileDataResponseDto>> getProfileData(String token);

}