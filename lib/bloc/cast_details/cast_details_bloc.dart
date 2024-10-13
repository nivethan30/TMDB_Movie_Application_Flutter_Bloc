import 'dart:async';
import '../../models/cast_model/cast_movie_model.dart';
import '../../repository/cast_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/cast_model/cast_model.dart';
import '../../utils/constants.dart';
part 'cast_details_event.dart';
part 'cast_details_state.dart';

class CastDetailsBloc extends Bloc<CastDetailsEvent, CastDetailsState> {
  final CastApi _castApi;
  final List<CastMovieModel> _castMovieModel = [];
  CastDetailsBloc(this._castApi) : super(CastDetailsInitial()) {
    on<GetCastDetailsEvent>(getCastDetailsEvent);
  }

  /// This method is called when the [GetCastDetailsEvent] is added to the
  /// [CastDetailsBloc]. It first checks if the cast details for the given
  /// movie ID is already in the [_castMovieModel] list. If it exists, it
  /// emits a [CastDetailsLoaded] state with the cast details. If it does not
  /// exist, it fetches the cast details from the [_castApi] and adds the
  /// [CastMovieModel] to the [_castMovieModel] list. Then, it emits a
  /// [CastDetailsLoaded] state with the cast details. If there is an error
  /// in the network call, it emits a [CastDetailsError] state with the error
  /// message.
  FutureOr<void> getCastDetailsEvent(
      GetCastDetailsEvent event, Emitter<CastDetailsState> emit) async {
    emit(CastDetailsLoading());
    try {
      CastMovieModel existingCastMovie = _castMovieModel.firstWhere(
          (e) => e.movieId == event.movieId,
          orElse: () => defaultCastMovieModel);
      if (existingCastMovie.movieId != -1) {
        emit(CastDetailsLoaded(cast: existingCastMovie.castList));
        return;
      }
      final List<CastModel> castDetails =
          await _castApi.getCastDetails(event.movieId);
      CastMovieModel castMovie =
          CastMovieModel(movieId: event.movieId, castList: castDetails);
      _castMovieModel.add(castMovie);
      emit(CastDetailsLoaded(cast: castDetails));
    } catch (e) {
      emit(CastDetailsError(error: e.toString()));
    }
  }
}
