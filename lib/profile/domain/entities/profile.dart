import 'results.dart';

import 'info.dart';

abstract class Profile {
  final List<Results> results;
  final Info info;

  Profile({
    required this.results,
    required this.info,
  });
}
