import '../core/api_result.dart';
import '../entities/profile/profile_data_entity.dart';

abstract class ProfileRepository{
  Future<Result<ProfileDataEntity>> getProfileData(String token);
}