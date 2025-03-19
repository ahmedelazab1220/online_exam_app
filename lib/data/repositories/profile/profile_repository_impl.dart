import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/core/api_result.dart';
import 'package:online_exam_app/domain/entities/profile/profile_data_entity.dart';

import '../../../domain/repositories/profile_repository.dart';
import '../../api/models/profile/user_data/response/profile_data_response_dto.dart';
import '../../datasource/contract/profile/profile_data_remote_datasource.dart';
@Injectable(as: ProfileRepository)

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource profileDataRemoteDatasource;
  ProfileRepositoryImpl(this.profileDataRemoteDatasource);

  @override
  Future<Result<ProfileDataEntity>> getProfileData(String token) async {
    final result = await profileDataRemoteDatasource.getProfileData(token);

    if (result is SuccessResult<ProfileDataResponseDto>) {
      return SuccessResult(result.data.toDomain());
    } else if (result is FailureResult<ProfileDataResponseDto>) {
      return FailureResult(result.exception);
    }
    return FailureResult(Exception("Unknown error occurred"));

  }
}