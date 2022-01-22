import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile/core/error/failures.dart';
import 'package:flutter_profile/profile/domain/entities/profile.dart';
import 'package:flutter_profile/profile/domain/usecases/get_profile_usecase.dart';

import 'profile_event.dart';
import 'profile_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._getprofile,
  ) : super(ProfileState.initial());
  final GetProfileUseCase _getprofile;

  ProfileState get initialState => Empty();

  @override
  Stream<ProfileState> _eitherLoadedOrErrorState(
    Either<Failure, Profile> failureOrProfile,
  ) async* {
    if (event is GetProfile) {

      yield* failureOrProfile.fold(
        (failure) async* {
          yield Error(message: SERVER_FAILURE_MESSAGE);
        },
        (integer) async* {
          yield Loading();
          final failureOrTrivia =
              await _getprofile(ProfileParams ());
          yield* _eitherLoadedOrErrorState(failureOrTrivia);
        },
      );
    yield failureOrProfile.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (Profile) => Loaded(Profile),
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
