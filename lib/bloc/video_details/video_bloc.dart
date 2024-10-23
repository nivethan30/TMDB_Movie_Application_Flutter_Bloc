import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../utils/constants.dart';
import '../../models/video_model/video_model.dart';
import '../../models/video_model/video_movie_model.dart';
import '../../repository/video_api.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoApi _videoApi;
  final List<VideoMovieModel> _videoMovieModel = [];
  static List<VideoModel> _videos = [];
  static List<VideoModel> get videos => _videos;
  VideoBloc(this._videoApi) : super(VideoInitial()) {
    on<FetchVideoDetails>(fetchVideoDetails);
  }

  /// This method is called when the [FetchVideoDetails] event is added to the
  /// [VideoBloc]. It first checks if the video details for the given movie ID
  /// is already in the [_videoMovieModel] list. If it exists, it emits a
  /// [VideoDetailsFetchedState] state with the video details. If it does
  /// not exist, it fetches the video details from the [_videoApi] and adds the
  /// [VideoMovieModel] to the [_videoMovieModel] list. Then, it emits a
  /// [VideoDetailsFetchedState] state with the video details. If there is an
  /// error in the network call, it emits a [VideoDetailsFetchingError] state
  /// with the error message.
  FutureOr<void> fetchVideoDetails(
      FetchVideoDetails event, Emitter<VideoState> emit) async {
    emit(VideoDetailsLoadingState());
    try {
      VideoMovieModel existingVideoDetails = _videoMovieModel.firstWhere(
          (e) => e.movieId == event.movieId,
          orElse: () => defaultVideoMovieModel);
      if (existingVideoDetails.movieId != -1) {
        emit(VideoDetailsFetchedState(
            videoDetails: existingVideoDetails.videoModel));
        return;
      }
      final List<VideoModel> videoDetails =
          await _videoApi.fetchMovieVideos(event.movieId);
      _videos = videoDetails;
      VideoMovieModel videoMovie =
          VideoMovieModel(movieId: event.movieId, videoModel: videoDetails);
      _videoMovieModel.add(videoMovie);
      emit(VideoDetailsFetchedState(videoDetails: videoDetails));
    } catch (e) {
      emit(VideoDetailsFetchingError(error: e.toString()));
    }
  }
}
