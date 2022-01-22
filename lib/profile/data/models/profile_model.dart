import '../../domain/entities/info.dart';
import '../../domain/entities/profile.dart';
import '../../domain/entities/results.dart';

import 'info_model.dart';
import 'result_model.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required List<Results> results,
    required Info info,
  }) : super(results: results, info: info);

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      results: ResultModel.fromJson(json['results']),
      info: InfoModel.fromJson(json['info']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'info': info,
    };
  }
}
