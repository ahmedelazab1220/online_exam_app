import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/models/auth/user/user_dto.dart';
import 'package:online_exam_app/data/local_database/models/user/local_user.dart';
import 'package:online_exam_app/data/local_database/user_local_database/user_local_database.dart';

import '../contract/auth_local_datasource.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage storage;
  final UsersLocalDatabase usersLocalDatabase;

  AuthLocalDatasourceImpl(
    this.storage,
    this.usersLocalDatabase,
  );

  @override
  Future<void> saveToken(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  @override
  Future<void> saveUser(UserDto? userDto) async {
    if (userDto != null) {
      usersLocalDatabase.addUser(LocalUser.fromDataSource(userDto));
    }
  }

  @override
  Future<LocalUser?> getUser() async {
    return usersLocalDatabase.getUser();
  }
}
