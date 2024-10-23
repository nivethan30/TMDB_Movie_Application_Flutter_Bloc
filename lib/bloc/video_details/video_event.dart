part of 'video_bloc.dart';

abstract class VideoEvent {}

class FetchVideoDetails extends VideoEvent {
  final int movieId;
  FetchVideoDetails(this.movieId);
}