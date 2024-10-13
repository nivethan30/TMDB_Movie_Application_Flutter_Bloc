part of 'top_rated_bloc.dart';

abstract class TopRatedEvent {}

class FetchTopRatedMovies extends TopRatedEvent {}

class RefreshTopRatedMovies extends TopRatedEvent {}
