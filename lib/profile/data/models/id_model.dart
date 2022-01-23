import '../../domain/entities/id.dart';

class IdModel extends Id {
  IdModel({
    required String name,
    required String value,
  }) : super(
          name: name,
          value: value,
        );

  factory IdModel.fromJson(Map<String, dynamic> json) {
    return IdModel(
      name: json['name'],
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
    };
  }
}
