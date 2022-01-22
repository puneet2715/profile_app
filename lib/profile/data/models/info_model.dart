import '../../domain/entities/info.dart';

class InfoModel extends Info {
  InfoModel({
    required String seed,
    required num results,
    required num page,
    required String version,
  }) : super(
          seed: seed,
          results: results,
          page: page,
          version: version,
        );

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      seed: json['seed'],
      results: json['results'],
      page: json['page'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'seed': seed,
      'results': results,
      'page': page,
      'version': version,
    };
  }
}
