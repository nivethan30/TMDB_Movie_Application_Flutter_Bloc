import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/movie_model/movie_model.dart';
import '../../repository/movie_api.dart';
import '../../utils/constants.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieApi _movieApi;
  final List<MovieModel> _movieList = [];

  MovieDetailsBloc(this._movieApi) : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>(fetchMovieDetails);
  }

  /// This method is called when the [FetchMovieDetails] event is added to the
  /// [MovieDetailsBloc]. It first checks if the movie details for the given
  /// movie ID is already in the [_movieList] list. If it exists, it
  /// emits a [MovieDetailsFetched] state with the movie details. If it does
  /// not exist, it fetches the movie details from the [_movieApi] and adds the
  /// [MovieModel] to the [_movieList] list. Then, it emits a
  /// [MovieDetailsFetched] state with the movie details. If there is an error
  /// in the network call, it emits a [MovieDetailsError] state with the error
  /// message.
  FutureOr<void> fetchMovieDetails(
      FetchMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());

    try {
      MovieModel? existingMovie = _movieList.firstWhere(
          (movie) => movie.id == event.movieId,
          orElse: () => defaultMovieModel);

      if (existingMovie.id != -1) {
        emit(MovieDetailsFetched(movie: existingMovie));
        return;
      }

      final MovieModel movieDetails =
          await _movieApi.getMovieDetails(event.movieId);
      _movieList.add(movieDetails);
      emit(MovieDetailsFetched(movie: movieDetails));
    } catch (e) {
      emit(MovieDetailsError(error: e.toString()));
    }
  }
}
