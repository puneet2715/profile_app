import '../../domain/entities/dob.dart';

class DobModel extends Dob {
  DobModel({
    required String date,
    required String age,
  }) : super(date: date, age: age);

  factory DobModel.fromJson(Map<String, dynamic> json) {
    return DobModel(
      date: json['date'],
      age: json['age'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'age': age,
    };
  }
}
