import 'package:dartz/dartz.dart';
import 'package:flutter_profile/core/error/exceptions.dart';
import 'package:flutter_profile/core/error/failures.dart';
import 'package:flutter_profile/core/network/network_info.dart';
import 'package:flutter_profile/profile/data/datasources/profile_local_data_source.dart';
import 'package:flutter_profile/profile/data/datasources/profile_remote_data_source.dart';
import 'package:flutter_profile/profile/domain/entities/profile.dart';
import 'package:flutter_profile/profile/domain/repositories/i_profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProfileRepository)
class ProfileRepository implements IProfileRepository {
  ProfileRepository(
      this._networkInfo, this._remoteDataSource, this._localDataSource);

  final ProfileLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final ProfileRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    if (await _networkInfo.isConnected) {
      try {
        final models = await _remoteDataSource.getProfile();
        final entities = models;
        //final entities = models.map<Profile>((e) => e.toEntity()).toList();
        await _localDataSource.cacheProfile(models);
        return Right(entities);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try {
      //   final models = _localDataSource.getLastProfile();
      //   final entities = models.map<Profile>((e) => e.toEntity()).toList();
      //   return Right(entities);
      // } on CacheException {
      return Left(CacheFailure());
    }
  }
}
//}
