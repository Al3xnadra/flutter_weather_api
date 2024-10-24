// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_weather_api/core/injection_container.dart' as _i509;
import 'package:flutter_weather_api/data/remote_data_source/weather_remote_data_source.dart'
    as _i1024;
import 'package:flutter_weather_api/domain/repositories/weather_repository.dart'
    as _i418;
import 'package:flutter_weather_api/features/home/cubit/home_cubit.dart'
    as _i524;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i361.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i1024.WeatherRemoteRetrofitDataSource>(
        () => _i1024.WeatherRemoteRetrofitDataSource(gh<_i361.Dio>()));
    gh.factory<_i418.WeatherRepository>(() =>
        _i418.WeatherRepository(gh<_i1024.WeatherRemoteRetrofitDataSource>()));
    gh.factory<_i524.HomeCubit>(
        () => _i524.HomeCubit(gh<_i418.WeatherRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i509.RegisterModule {}
