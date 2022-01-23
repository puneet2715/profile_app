import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile/core/error/failures.dart';
import 'package:flutter_profile/profile/domain/entities/profile.dart';
import 'package:flutter_profile/profile/domain/usecases/get_profile_usecase.dart';
import 'package:injectable/injectable.dart';

import 'profile_event.dart';
import 'profile_state.dart';

// ignore: constant_identifier_names
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
// ignore: constant_identifier_names
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

@lazySingleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getprofile;

  ProfileBloc(
    this._getprofile,
  ) : super(ProfileEmpty()) {
    on<GetProfile>(_onGetProfile);
    add(GetProfile());
  }

  Future<void> _onGetProfile(
      GetProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final failureOrProfile = await _getprofile(ProfileParams());
    emit(await _eitherLoadedOrErrorState(failureOrProfile));
  }

  Future<ProfileState> _eitherLoadedOrErrorState(
    Either<Failure, Profile> failureOrProfile,
  ) async {
    return failureOrProfile.fold(
      (failure) => ProfileError(message: _mapFailureToMessage(failure)),
      (profile) => ProfileLoaded(profile),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
