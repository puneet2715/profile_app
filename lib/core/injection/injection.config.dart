// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../profile/data/datasources/profile_local_data_source.dart' as _i7;
import '../../profile/data/datasources/profile_remote_data_source.dart' as _i5;
import '../../profile/data/repositories/profile_repository.dart' as _i9;
import '../../profile/domain/repositories/i_profile_repository.dart' as _i8;
import '../../profile/domain/usecases/get_profile_usecase.dart' as _i10;
import '../../profile/presentation/bloc/profile_bloc.dart' as _i11;
import '../network/network_info.dart' as _i4;
import 'register_module.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.MyInternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.lazySingleton<_i4.NetworkInfo>(
      () => _i4.NetworkInfo(get<_i3.MyInternetConnectionChecker>()));
  gh.lazySingleton<_i5.ProfileRemoteDataSource>(
      () => _i5.ProfileRemoteDataSourceImpl());
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i7.ProfileLocalDataSource>(() =>
      _i7.ProfileLocalDataSourceImpl(
          sharedPreferences: get<_i6.SharedPreferences>()));
  gh.lazySingleton<_i8.IProfileRepository>(() => _i9.ProfileRepository(
      get<_i4.NetworkInfo>(),
      get<_i5.ProfileRemoteDataSource>(),
      get<_i7.ProfileLocalDataSource>()));
  gh.lazySingleton<_i10.GetProfileUseCase>(
      () => _i10.GetProfileUseCase(get<_i8.IProfileRepository>()));
  gh.lazySingleton<_i11.ProfileBloc>(
      () => _i11.ProfileBloc(get<_i10.GetProfileUseCase>()));
  return get;
}

class _$RegisterModule extends _i3.RegisterModule {}
