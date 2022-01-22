import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/profile.dart';
import '../repositories/i_profile_repository.dart';

@lazySingleton
class GetProfileUseCase extends UseCase<Profile, ProfileParams> {
  GetProfileUseCase(this.repository);

  final IProfileRepository repository;

  @override
  Future<Either<Failure, Profile>> call(ProfileParams params) async {
    return repository.getProfile();
  }
}

class ProfileParams {}
