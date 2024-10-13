import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/movie_list_model/movie_list_model.dart';
import '../../repository/movie_list_api.dart';
part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final List<MovieListModel> _popularMovies = [];
  final MovieListApi _movieListApi;
  int _page = 1;
  bool _isFetched = false;
  bool _hasMoreMovies = true;

  PopularBloc(this._movieListApi) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>(fetchPopularMovies);
    on<RefreshPopularMovies>(refreshPopularMovies);
  }

  /// Fetches popular movies from the API.
  ///
  /// If the bloc is already in [PopularMoviesFetched] state and there are no
  /// more movies to fetch, it just returns and does nothing.
  ///
  /// Otherwise, it emits [PopularFetchLoading] state and then fetches the
  /// movies. If the fetch is successful, it adds the fetched movies to the
  /// [_popularMovies] list and updates the [_page] and [_isFetched] fields.
  /// Then it emits the [PopularMoviesFetched] state with the updated list of
  /// movies.
  ///
  /// If the fetch fails, it emits the [PopularFetchError] state with the
  /// corresponding error message.
  FutureOr<void> fetchPopularMovies(
      FetchPopularMovies event, Emitter<PopularState> emit) async {
    if (_isFetched && !_hasMoreMovies) {
      emit(PopularMoviesFetched(popularMovies: _popularMovies));
      return;
    }
    emit(PopularFetchLoading());
    try {
      final List<MovieListModel> popularMovies =
          await _movieListApi.getPopularMovies(page: _page);

      if (popularMovies.isNotEmpty) {
        _popularMovies.addAll(popularMovies);
        _page++;
        _isFetched = true;
      } else {
        _hasMoreMovies = false;
      }

      emit(PopularMoviesFetched(popularMovies: _popularMovies));
    } catch (e) {
      emit(PopularFetchError(error: e.toString()));
    }
  }

  /// Refreshes the list of popular movies by clearing the current list and
  /// fetching new movies from the API.
  ///
  /// Emits [PopularFetchLoading] state initially and then emits either
  /// [PopularMoviesFetched] if the fetch is successful or
  /// [PopularFetchError] if the fetch fails.
  FutureOr<void> refreshPopularMovies(
      RefreshPopularMovies event, Emitter<PopularState> emit) async {
    emit(PopularFetchLoading());

    _page = 1;
    _hasMoreMovies = true;
    _popularMovies.clear();
    try {
      final List<MovieListModel> popularMovies =
          await _movieListApi.getPopularMovies(page: _page);
      _popularMovies.addAll(popularMovies);

      if (popularMovies.isNotEmpty) {
        _page++;
        _isFetched = true;
      } else {
        _hasMoreMovies = false;
      }

      emit(PopularMoviesFetched(popularMovies: _popularMovies));
    } catch (e) {
      emit(PopularFetchError(error: e.toString()));
    }
  }
}
