import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MyInternetConnectionChecker {
  InternetConnectionChecker? connectionChecker;
  Future<bool> get hasConnection async {
    if (kIsWeb) {
      return true;
    } else {
      connectionChecker ??= InternetConnectionChecker();
      return connectionChecker!.hasConnection;
    }
  }
}

@module
abstract class RegisterModule {
  @lazySingleton
  MyInternetConnectionChecker get connectionChecker =>
      MyInternetConnectionChecker();

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
