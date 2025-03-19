import 'package:injectable/injectable.dart';
import 'package:online_exam_app/domain/entities/profile/profile_data_entity.dart';
import 'package:online_exam_app/domain/repositories/profile_repository.dart';

import '../../core/api_result.dart';

@injectable
class ProfileDataUseCase {
  final ProfileRepository repository;

  ProfileDataUseCase({required this.repository});

  Future<Result<ProfileDataEntity>> call(String token) async {
    return await repository.getProfileData(token);
  }
}