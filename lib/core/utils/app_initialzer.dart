import 'package:injectable/injectable.dart';

import 'providers/user_session_provider.dart';

@lazySingleton
class AppInitializer {
  UserSessionProvider userSessionProvider;

  AppInitializer(this.userSessionProvider);
}
