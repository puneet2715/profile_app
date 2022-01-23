import 'coordinates_model.dart';
import 'street_model.dart';
import 'timezone_model.dart';
import '../../domain/entities/coordinates.dart';
import '../../domain/entities/location.dart';
import '../../domain/entities/street.dart';
import '../../domain/entities/timezone.dart';

class LocationModel extends Location {
  LocationModel({
    required Street street,
    required String city,
    required String state,
    required String country,
    required String postcode,
    required Coordinates coordinates,
    required Timezone timezone,
  }) : super(
          street: street,
          city: city,
          state: state,
          country: country,
          postcode: postcode,
          coordinates: coordinates,
          timezone: timezone,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      street: StreetModel.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      coordinates: CoordinatesModel.fromJson(json['coordinates']),
      timezone: TimezoneModel.fromJson(json['timezone']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'coordinates': coordinates,
      'timezone': timezone,
    };
  }
}
