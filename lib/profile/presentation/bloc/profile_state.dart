import 'package:equatable/equatable.dart';
import 'package:flutter_profile/profile/domain/entities/profile.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProfileState {}

class Loading extends ProfileState {}

class Loaded extends ProfileState {
  final Profile profile;

  Loaded(this.profile);

  @override
  List<Object> get props => [profile];
}

class Error extends ProfileState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
