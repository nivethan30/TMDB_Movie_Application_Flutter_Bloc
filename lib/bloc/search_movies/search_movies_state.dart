part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesFetched extends SearchMoviesState {
  final List<MovieListModel> movieList;

  SearchMoviesFetched({required this.movieList});

  @override
  List<Object> get props => [movieList];
}

class SearchMoviesError extends SearchMoviesState {
  final String error;

  SearchMoviesError({required this.error});
}
