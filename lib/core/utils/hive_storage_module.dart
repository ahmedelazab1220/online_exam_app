import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../data/local_database/models/user/local_user.dart';
import 'constants.dart';

@module
abstract class HiveStorageModule {
  @preResolve
  @Named(Constants.userBox)
  Future<Box<LocalUser>> get userBox async {
    return await Hive.openBox<LocalUser>(Constants.userBox);
  }
}
