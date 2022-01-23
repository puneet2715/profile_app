import 'package:equatable/equatable.dart';
import 'package:flutter_profile/profile/domain/entities/profile.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileEmpty extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;

  ProfileLoaded(this.profile);

  @override
  List<Object> get props => [profile];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});

  @override
  List<Object> get props => [message];
}
