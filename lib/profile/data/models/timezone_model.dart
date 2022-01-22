import '../../domain/entities/timezone.dart';

class TimezoneModel extends Timezone {
  TimezoneModel({
    required String offset,
    required String description,
  }) : super(offset: offset, description: description);

  factory TimezoneModel.fromJson(Map<String, dynamic> json) {
    return TimezoneModel(
      offset: json['offset'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'description': description,
    };
  }
}
