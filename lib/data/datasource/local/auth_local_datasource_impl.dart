import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../contract/auth_local_datasource.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage storage;

  AuthLocalDatasourceImpl(this.storage);

  @override
  Future<void> saveData(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
