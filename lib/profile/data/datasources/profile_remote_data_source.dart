import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_profile/core/error/exceptions.dart';
import 'package:flutter_profile/profile/data/models/profile_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDataSource {
  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final http.Client client = http.Client();

  ProfileRemoteDataSourceImpl();

  @override
  Future<ProfileModel> getProfile() =>
      _getProfileFromUrl('https://randomuser.me/api/');

  Future<ProfileModel> _getProfileFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("❤️❤️❤️❤️");
      // ignore: avoid_print
      print(json.decode(response.body));
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
