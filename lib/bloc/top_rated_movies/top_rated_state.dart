part of 'top_rated_bloc.dart';

abstract class TopRatedState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {}

class TopRatedFetchLoading extends TopRatedState {}

class TopRatedFetched extends TopRatedState {
  final List<MovieListModel> topRatedMovies;
  TopRatedFetched({required this.topRatedMovies});

  @override
  List<Object> get props => [topRatedMovies];
}

class TopRatedFetchError extends TopRatedState {
  final String error;
  TopRatedFetchError({required this.error});
}
