import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/movie_list_model/movie_list_model.dart';
import '../../repository/search_api.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchApi _searchApi;
  final List<MovieListModel> _movieList = [];
  String _query = "";
  int _page = 1;
  bool _hasMoreMovies = true;
  SearchMoviesBloc(this._searchApi) : super(SearchMoviesInitial()) {
    on<SearchMoviesQueryEvent>(searchMoviesQueryEvent);
  }

  /// Handles a [SearchMoviesQueryEvent]. If the query is different from the previous query,
  /// it resets the page and the list of movies and emits a [SearchMoviesLoading] state.
  /// Otherwise, if there are no more movies for the current query, it does nothing.
  /// Otherwise, it increments the page, searches for the movies, and if successful,
  /// emits a [SearchMoviesFetched] state with the list of movies. If there are no more
  /// movies, it sets [_hasMoreMovies] to false and emits a [SearchMoviesFetched] state.
  /// If the search fails, it emits a [SearchMoviesError] state with the error message.
  FutureOr<void> searchMoviesQueryEvent(
      SearchMoviesQueryEvent event, Emitter<SearchMoviesState> emit) async {
    if (_query != event.query) {
      _page = 1;
      _movieList.clear();
      _hasMoreMovies = true;
      _query = event.query;
      emit(SearchMoviesLoading());
    } else if (!_hasMoreMovies) {
      return;
    } else {
      _page++;
    }
    try {
      final List<MovieListModel> searchResults =
          await _searchApi.searchMovies(event.query, _page);

      if (searchResults.isNotEmpty) {
        _movieList.addAll(searchResults);
        emit(SearchMoviesFetched(movieList: _movieList));
      } else {
        _hasMoreMovies = false;
        emit(SearchMoviesFetched(movieList: _movieList));
      }
    } catch (e) {
      emit(SearchMoviesError(error: e.toString()));
    }
  }
}
