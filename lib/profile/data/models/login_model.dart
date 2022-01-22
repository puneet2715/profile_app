import '../../domain/entities/login.dart';

class LoginModel extends Login {
  LoginModel({
    required String uuid,
    required String username,
    required String password,
    required String salt,
    required String md5,
    required String sha1,
    required String sha256,
  }) : super(
          uuid: uuid,
          username: username,
          password: password,
          salt: salt,
          md5: md5,
          sha1: sha1,
          sha256: sha256,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      uuid: json['uuid'],
      username: json['username'],
      password: json['password'],
      salt: json['salt'],
      md5: json['md5'],
      sha1: json['sha1'],
      sha256: json['sha256'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'username': username,
      'password': password,
      'salt': salt,
      'md5': md5,
      'sha1': sha1,
      'sha256': sha256,
    };
  }
}
