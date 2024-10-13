part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent {}

class SearchMoviesQueryEvent extends SearchMoviesEvent {
  final String query;

  SearchMoviesQueryEvent({required this.query});
}
