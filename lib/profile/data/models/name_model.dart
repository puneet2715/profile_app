import '../../domain/entities/name.dart';

class NameModel extends Name {
  NameModel({
    required String title,
    required String first,
    required String last,
  }) : super(title: title, first: first, last: last);

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }
}
