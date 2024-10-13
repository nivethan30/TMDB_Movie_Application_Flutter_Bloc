import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/movie_list_model/movie_list_model.dart';
import '../../repository/movie_list_api.dart';
part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final List<MovieListModel> _topRatedMovies = [];
  int _page = 1;
  bool _isFetched = false;
  bool _hasMoreMovies = true;
  final MovieListApi _movieListApi;

  TopRatedBloc(this._movieListApi) : super(TopRatedInitial()) {
    on<FetchTopRatedMovies>(fetchTopRatedMovies);
    on<RefreshTopRatedMovies>(refreshTopRatedMovies);
  }

  /// Fetches top rated movies from the Movie Database API.
  ///
  /// The [event] parameter is not used.
  ///
  /// If the state of the bloc is [TopRatedInitial] or
  /// [TopRatedFetchError], or if there are more movies to fetch, it emits
  /// [TopRatedFetchLoading] and then fetches the movies using the
  /// [_movieListApi]. If the fetch is successful, it emits [TopRatedFetched]
  /// with the fetched movies. If the fetch fails, it emits
  /// [TopRatedFetchError] with the error message.
  FutureOr<void> fetchTopRatedMovies(
      FetchTopRatedMovies event, Emitter<TopRatedState> emit) async {
    if (_isFetched && !_hasMoreMovies) {
      emit(TopRatedFetched(topRatedMovies: _topRatedMovies));
      return;
    }
    emit(TopRatedFetchLoading());
    try {
      final List<MovieListModel> topRatedMovies =
          await _movieListApi.getTopRatedMovies(page: _page);

      if (topRatedMovies.isNotEmpty) {
        _topRatedMovies.addAll(topRatedMovies);
        _page++;
        _isFetched = true;
      } else {
        _hasMoreMovies = false;
      }

      emit(TopRatedFetched(topRatedMovies: _topRatedMovies));
    } catch (e) {
      emit(TopRatedFetchError(error: e.toString()));
    }
  }

  /// Refreshes the list of top rated movies from the Movie Database API.
  ///
  /// The [event] parameter is not used.
  ///
  /// It resets the page number to 1, and the list of top rated movies to an
  /// empty list. It then fetches the top rated movies from the
  /// [_movieListApi]. If the fetch is successful, it emits [TopRatedFetched]
  /// with the fetched movies. If the fetch fails, it emits
  /// [TopRatedFetchError] with the error message.
  FutureOr<void> refreshTopRatedMovies(
      RefreshTopRatedMovies event, Emitter<TopRatedState> emit) async {
    emit(TopRatedFetchLoading());

    _page = 1;
    _hasMoreMovies = true;
    _topRatedMovies.clear();
    try {
      final List<MovieListModel> topRatedMovies =
          await _movieListApi.getTopRatedMovies(page: _page);
      _topRatedMovies.addAll(topRatedMovies);

      if (topRatedMovies.isNotEmpty) {
        _page++;
        _isFetched = true;
      } else {
        _hasMoreMovies = false;
      }

      emit(TopRatedFetched(topRatedMovies: _topRatedMovies));
    } catch (e) {
      emit(TopRatedFetchError(error: e.toString()));
    }
  }
}
