// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../data/api/api_manager.dart' as _i442;
import '../../data/api/auth/auth_retrofit_client.dart' as _i797;
import '../../data/api/dio_provider.dart' as _i304;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i488;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i912;
import '../../data/datasource/local/auth_local_datasource_impl.dart' as _i938;
import '../../data/datasource/remote/auth_remote_datasource_impl.dart' as _i498;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/use_case/forget_password_use_case.dart' as _i742;
import '../../features/forget_password/presentation/view_model/forget_password_cubit/forget_password_cubit.dart'
    as _i1009;
import '../utils/loggger/logger_module.dart' as _i473;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    final dioProvider = _$DioProvider();
    gh.singleton<_i442.ApiManager>(() => _i442.ApiManager());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i361.Dio>(() => dioProvider.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioProvider.providerInterceptor());
    gh.lazySingleton<_i797.AuthRetrofitClient>(
        () => _i797.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i488.AuthLocalDatasource>(
        () => _i938.AuthLocalDatasourceImpl());
    gh.factory<_i912.AuthRemoteDatasource>(() => _i498.AuthRemoteDatasourceImpl(
          gh<_i797.AuthRetrofitClient>(),
          gh<_i442.ApiManager>(),
        ));
    gh.factory<_i1073.AuthRepository>(() => _i895.AuthRepositoryImpl(
          gh<_i488.AuthLocalDatasource>(),
          gh<_i912.AuthRemoteDatasource>(),
        ));
    gh.factory<_i742.ForgetPasswordUseCase>(() =>
        _i742.ForgetPasswordUseCase(repository: gh<_i1073.AuthRepository>()));
    gh.factory<_i1009.ForgetPasswordCubit>(
        () => _i1009.ForgetPasswordCubit(gh<_i742.ForgetPasswordUseCase>()));
    return this;
  }
}

class _$LoggerModule extends _i473.LoggerModule {}

class _$DioProvider extends _i304.DioProvider {}
