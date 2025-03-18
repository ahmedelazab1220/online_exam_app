import 'package:online_exam_app/data/local_database/models/user/local_user.dart';
import 'package:online_exam_app/domain/entities/auth/user_entity.dart';

abstract class AuthLocalDatasource {
  Future<void> saveToken(String key, String value);

  Future<void> saveUser(UserEntity userEntity);

  Future<LocalUser?> getUser();
}
