import 'package:online_exam_app/data/local_database/models/user/local_user.dart';

import '../../api/models/auth/user/user_dto.dart';

abstract class AuthLocalDatasource {
  Future<void> saveToken(String key, String value);

  Future<void> saveUser(UserDto userDto);

  Future<LocalUser?> getUser();
}
