import 'coordinates.dart';
import 'street.dart';
import 'timezone.dart';

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final Coordinates coordinates;
  final Timezone timezone;
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });
}
