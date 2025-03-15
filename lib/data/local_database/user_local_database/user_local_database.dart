import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utils/constants.dart';
import '../models/user/local_user.dart';

@singleton
class UsersLocalDatabase {
  final Box<LocalUser> localUserBox;

  UsersLocalDatabase(@Named(Constants.userBox) this.localUserBox);

  void addUser(LocalUser user) => localUserBox.put(Constants.user, user);

  LocalUser? getUser() => localUserBox.get(Constants.user);
}
