import 'dart:convert';

import 'package:flutter_profile/core/error/exceptions.dart';
import 'package:flutter_profile/profile/data/models/profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileLocalDataSource {
  /// Gets the cached [ProfileModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<ProfileModel> getLastProfile();

  Future<void> cacheProfile(ProfileModel triviaToCache);
}

// ignore: constant_identifier_names
const CACHED_PROFILE = 'CACHED_PROFILE';

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ProfileModel> getLastProfile() {
    final jsonString = sharedPreferences.getString(CACHED_PROFILE);
    if (jsonString != null) {
      return Future.value(ProfileModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheProfile(ProfileModel profileToCache) {
    return sharedPreferences.setString(
      CACHED_PROFILE,
      json.encode(profileToCache.toJson()),
    );
  }
}
