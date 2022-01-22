import '../../domain/entities/coordinates.dart';

class CoordinatesModel extends Coordinates {
  CoordinatesModel({
    required String latitude,
    required String longitude,
  }) : super(latitude: latitude, longitude: longitude);

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
