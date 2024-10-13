part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent {}

class FetchMovieDetails extends MovieDetailsEvent {
  final int movieId;
  FetchMovieDetails({required this.movieId});
}
