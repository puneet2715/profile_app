import 'package:flutter_profile/core/injection/register_module.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkInfo {
  const NetworkInfo(this.connectionChecker);

  final MyInternetConnectionChecker connectionChecker;

  Future<bool> get isConnected => connectionChecker.hasConnection;
}
