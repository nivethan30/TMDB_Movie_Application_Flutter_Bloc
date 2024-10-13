import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/movie_list_model/movie_list_model.dart';
import '../../repository/movie_list_api.dart';
part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final MovieListApi _movieListApi;
  final List<MovieListModel> _upcomingMovies = [];
  int _page = 1;
  bool _isFetched = false;
  bool _hasMoreMovies = true;

  UpcomingBloc(this._movieListApi) : super(UpcomingInitial()) {
    on<FetchUpcomingMovies>(fetchUpcomingMovies);
    on<RefreshUpcomingMovies>(refreshUpcomingMovies);
  }

  /// Fetches upcoming movies from the Movie Database API.
  ///
  /// The [event] parameter is not used.
  ///
  /// If the state of the bloc is [UpcomingInitial] or
  /// [UpcomingFetchError], or if there are more movies to fetch, it emits
  /// [UpcomingFetchLoading] and then fetches the movies using the
  /// [_movieListApi]. If the fetch is successful, it emits [UpcomingFetched]
  /// with the fetched movies. If the fetch fails, it emits
  /// [UpcomingFetchError] with the error message.
  FutureOr<void> fetchUpcomingMovies(
      FetchUpcomingMovies event, Emitter<UpcomingState> emit) async {
    if (_isFetched && !_hasMoreMovies) {
      emit(UpcomingFetched(upcomingMovies: _upcomingMovies));
      return;
    }
    emit(UpcomingFetchLoading());
    try {
      final List<MovieListModel> upcomingMovies =
          await _movieListApi.getUpcomingMovies(page: _page);

      if (upcomingMovies.isNotEmpty) {
        _upcomingMovies.addAll(upcomingMovies);
        _page++;
        _isFetched = true;
      } else {
        _hasMoreMovies = false;
      }

      emit(UpcomingFetched(upcomingMovies: _upcomingMovies));
    } catch (e) {
      emit(UpcomingFetchError(error: e.toString()));
    }
  }

  /// Refreshes the list of upcoming movies from the Movie Database API.
  ///
  /// The [event] parameter is not used.
  ///
  /// It resets the page number to 1, and the list of upcoming movies to an
  /// empty list. It then fetches the upcoming movies from the
  /// [_movieListApi]. If the fetch is successful, it emits [UpcomingFetched]
  /// with the fetched movies. If the fetch fails, it emits
  /// [UpcomingFetchError] with the error message.
  FutureOr<void> refreshUpcomingMovies(
      RefreshUpcomingMovies event, Emitter<UpcomingState> emit) async {
    emit(UpcomingFetchLoading());

    _page = 1;
    _hasMoreMovies = true;
    _upcomingMovies.clear();
    try {
      final List<MovieListModel> upcomingMovies =
          await _movieListApi.getUpcomingMovies(page: _page);
      _upcomingMovies.addAll(upcomingMovies);

      if (upcomingMovies.isNotEmpty) {
        _page++;
        _isFetched = true;
      } else {
        _hasMoreMovies = false;
      }

      emit(UpcomingFetched(upcomingMovies: _upcomingMovies));
    } catch (e) {
      emit(UpcomingFetchError(error: e.toString()));
    }
  }
}
