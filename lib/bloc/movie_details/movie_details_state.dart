part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsFetched extends MovieDetailsState {
  final MovieModel movie;

  MovieDetailsFetched({required this.movie});

  @override
  List<Object> get props => [movie];
}

class MovieDetailsError extends MovieDetailsState {
  final String error;

  MovieDetailsError({required this.error});
}
