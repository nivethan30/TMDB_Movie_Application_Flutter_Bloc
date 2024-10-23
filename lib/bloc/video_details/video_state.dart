part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoDetailsLoadingState extends VideoState {}

class VideoDetailsFetchedState extends VideoState {
  final List<VideoModel> videoDetails;

  VideoDetailsFetchedState({required this.videoDetails});

  @override
  List<Object> get props => [videoDetails];
}

class VideoDetailsFetchingError extends VideoState {
  final String error;

  VideoDetailsFetchingError({required this.error});
}
