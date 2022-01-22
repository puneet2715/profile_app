import 'location_model.dart';
import 'name_model.dart';
import 'picture_model.dart';
import '../../domain/entities/dob.dart';
import '../../domain/entities/id.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/name.dart';
import '../../domain/entities/picture.dart';
import '../../domain/entities/registered.dart';
import '../../domain/entities/results.dart';

import 'dob_model.dart';
import 'id_model.dart';
import 'login_model.dart';
import 'registered_model.dart';

class ResultModel extends Results {
  ResultModel({
    required String gender,
    required Name name,
    required Location location,
    required String email,
    required Login login,
    required Dob dob,
    required Registered registered,
    required String phone,
    required String cell,
    required Id id,
    required Picture picture,
    required String nat,
  }) : super(
          gender: gender,
          name: name,
          location: location,
          email: email,
          login: login,
          dob: dob,
          registered: registered,
          phone: phone,
          cell: cell,
          id: id,
          picture: picture,
          nat: nat,
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      gender: json['gender'],
      name: NameModel.fromJson(json['name']),
      location: LocationModel.fromJson(json['location']),
      email: json['email'],
      login: LoginModel.fromJson(json['login']),
      dob: DobModel.fromJson(json['dob']),
      registered: RegisteredModel.fromJson(json['registered']),
      phone: json['phone'],
      cell: json['cell'],
      id: IdModel.fromJson(json['id']),
      picture: PictureModel.fromJson(json['picture']),
      nat: json['nat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'name': name,
      'location': location,
      'email': email,
      'login': login,
      'dob': dob,
      'registered': registered,
      'phone': phone,
      'cell': cell,
      'id': id,
      'picture': picture,
      'nat': nat,
    };
  }
}
