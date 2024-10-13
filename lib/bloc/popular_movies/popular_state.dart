part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularState {}

class PopularFetchLoading extends PopularState {}

class PopularMoviesFetched extends PopularState {
  final List<MovieListModel> popularMovies;
  PopularMoviesFetched({required this.popularMovies});

  @override
  List<Object> get props => [popularMovies];
}

class PopularFetchError extends PopularState {
  final String error;
  PopularFetchError({required this.error});
}
