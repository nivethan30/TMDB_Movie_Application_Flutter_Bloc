part of 'cast_details_bloc.dart';

abstract class CastDetailsEvent {}

class GetCastDetailsEvent extends CastDetailsEvent {
  final int movieId;

  GetCastDetailsEvent({required this.movieId});
}
