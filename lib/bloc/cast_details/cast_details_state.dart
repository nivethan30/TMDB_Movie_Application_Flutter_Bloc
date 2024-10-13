part of 'cast_details_bloc.dart';

abstract class CastDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class CastDetailsInitial extends CastDetailsState {}

class CastDetailsLoading extends CastDetailsState {}

class CastDetailsLoaded extends CastDetailsState {
  final List<CastModel> cast;
  CastDetailsLoaded({required this.cast});

  @override
  List<Object> get props => [cast];
}

class CastDetailsError extends CastDetailsState {
  final String error;
  CastDetailsError({required this.error});
}
