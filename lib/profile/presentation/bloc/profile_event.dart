import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {
  GetProfile();

  @override
  List<Object> get props => [];
}
