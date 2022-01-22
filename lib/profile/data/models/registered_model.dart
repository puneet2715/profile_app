import '../../domain/entities/registered.dart';

class RegisteredModel extends Registered {
  RegisteredModel({
    required String date,
    required num age,
  }) : super(date: date, age: age);

  factory RegisteredModel.fromJson(Map<String, dynamic> json) {
    return RegisteredModel(
      date: json['date'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'age': age,
    };
  }
}
