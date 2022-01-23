import '../../domain/entities/profile.dart';

import 'info_model.dart';
import 'result_model.dart';

class ProfileModel extends Profile {
  ProfileModel({
    required List<ResultModel> results,
    required InfoModel info,
  }) : super(results: results, info: info);

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      // results: ResultModel.fromJson(i)),
      results: json['results']
          .map<ResultModel>((i) => ResultModel.fromJson(i))
          .toList(),
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
