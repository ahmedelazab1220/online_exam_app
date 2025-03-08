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
import '../../data/api/dio_module.dart' as _i719;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i488;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i912;
import '../../data/datasource/local/auth_local_datasource_impl.dart' as _i938;
import '../../data/datasource/remote/auth_remote_datasource_impl.dart' as _i498;
import '../../data/repositories/auth_repository_impl.dart' as _i895;
import '../../domain/repositories/auth_repository.dart' as _i1073;
import '../../domain/use_cases/forget_password_use_case.dart' as _i755;
import '../../features/bottom_navigation_bar/presentation/view_model/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart'
    as _i423;
import '../../domain/use_cases/otp_verify_use_case.dart' as _i833;
import '../../features/forget_password/presentation/view_model/forget_password_cubit/forget_password_cubit.dart'
    as _i1009;
import '../../features/otp_verify/presentation/view_model/otp_verify_cubit/otp_verify_cubit.dart'
    as _i897;
import '../utils/app_initialzer.dart' as _i860;
import '../utils/bloc_observer/bloc_observer_service.dart' as _i96;
import '../utils/logger/logger_module.dart' as _i997;
import '../utils/providers/user_session_provider.dart' as _i186;
import '../utils/validation/validator.dart' as _i225;

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
    final dioModule = _$DioModule();
    gh.factory<_i423.BottomNavigationBarCubit>(
        () => _i423.BottomNavigationBarCubit());
    gh.singleton<_i186.UserSessionProvider>(() => _i186.UserSessionProvider());
    gh.singleton<_i442.ApiManager>(() => _i442.ApiManager());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i225.Validator>(() => _i225.Validator());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => dioModule.providerInterceptor());
    gh.factory<_i96.BlocObserverService>(
        () => _i96.BlocObserverService(gh<_i974.Logger>()));
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
    gh.lazySingleton<_i860.AppInitializer>(
        () => _i860.AppInitializer(gh<_i186.UserSessionProvider>()));
    gh.factory<_i755.ForgetPasswordUseCase>(() =>
        _i755.ForgetPasswordUseCase(repository: gh<_i1073.AuthRepository>()));
    gh.factory<_i833.OtpVerifyUseCase>(
        () => _i833.OtpVerifyUseCase(repository: gh<_i1073.AuthRepository>()));
    gh.factory<_i1009.ForgetPasswordCubit>(() => _i1009.ForgetPasswordCubit(
          gh<_i755.ForgetPasswordUseCase>(),
          gh<_i225.Validator>(),
        ));
    gh.factory<_i897.OtpVerifyCubit>(() => _i897.OtpVerifyCubit(
          gh<_i833.OtpVerifyUseCase>(),
          gh<_i755.ForgetPasswordUseCase>(),
        ));
    return this;
  }
}

class _$LoggerModule extends _i997.LoggerModule {}

class _$DioModule extends _i719.DioModule {}
