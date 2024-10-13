part of 'upcoming_bloc.dart';

abstract class UpcomingState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingFetchLoading extends UpcomingState {}

class UpcomingFetched extends UpcomingState {
  final List<MovieListModel> upcomingMovies;
  UpcomingFetched({required this.upcomingMovies});

  @override
  List<Object> get props => [upcomingMovies];
}

class UpcomingFetchError extends UpcomingState {
  final String error;
  UpcomingFetchError({required this.error});
}
