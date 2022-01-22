import '../../domain/entities/picture.dart';

class PictureModel extends Picture {
  PictureModel({
    required String large,
    required String medium,
    required String thumbnail,
  }) : super(large: large, medium: medium, thumbnail: thumbnail);

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }
}
