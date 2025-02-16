import 'package:injectable/injectable.dart';

import '../contract/auth_local_datasource.dart';

@Singleton(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl extends AuthLocalDatasource {}
