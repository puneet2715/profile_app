import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile.dart';

abstract class IProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
}
