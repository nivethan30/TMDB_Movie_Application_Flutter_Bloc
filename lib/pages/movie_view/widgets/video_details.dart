import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../bloc/video_details/video_bloc.dart';
import '../../../utils/locators.dart';

class VideoDetails extends StatelessWidget {
  final int movieId;
  const VideoDetails({super.key, required this.movieId});

  @override
  ///
  /// This method builds the UI for the video details page. It returns a
  /// [BlocBuilder] widget that listens to the state of the [VideoBloc].
  ///
  /// If the state is [VideoDetailsLoading], it shows a
  /// [CircularProgressIndicator]. If the state is
  /// [VideoDetailsFetchingError], it shows a [SizedBox] with the error message
  /// and a [TextButton] to retry. If the state is
  /// [VideoDetailsFetchedState], it shows a [PageView] of the video
  /// items where each item is a [VideoPlayerItem] widget. The [VideoPlayerItem]
  /// widget displays the video with the given YouTube video id.
  ///
  /// Otherwise, it returns a [SizedBox] with height and width of 0.
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(builder: (context, state) {
      if (state is VideoDetailsLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is VideoDetailsFetchingError) {
        return SizedBox(
          height: 150,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state.error),
              TextButton(
                child: const Text('Retry'),
                onPressed: () {
                  locator<VideoBloc>()
                      .add(FetchVideoDetails(movieId));
                },
              ),
            ],
          ),
        );
      } else if (state is VideoDetailsFetchedState) {
        return SizedBox(
            height: 250,
            width: double.infinity,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return VideoPlayerItem(
                      videoUrl: state.videoDetails[index].key);
                }));
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({super.key, required this.videoUrl});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late YoutubePlayerController _controller;

  @override
  /// Initializes the [YoutubePlayerController] with the video id parsed from the given url
  /// and sets some flags to customize the player behavior.
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        autoPlay: false,
        mute: false,
        disableDragSeek: true,
      ),
    );
  }

  @override
  /// Releases the [YoutubePlayerController] resources and calls the parent [State]'s
  /// [dispose] method.
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  /// Returns a [SizedBox] widget that contains a [YoutubePlayer] displaying
  /// the video at the given url. The video is displayed in a [Padding]
  /// widget with a margin of 8 pixels on both sides, and the width of the
  /// video is set to 80% of the screen width.
  ///
  /// The [YoutubePlayer] is configured to not show the bottom actions bar
  /// and to show the video progress indicator.
  ///
  /// The [YoutubePlayerController] is initialized in the [initState] method
  /// and disposed in the [dispose] method.
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 200,
      width: scWidth * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: YoutubePlayer(
          width: scWidth * 0.8,
          controller: _controller,
          showVideoProgressIndicator: true,
          bottomActions: const [],
        ),
      ),
    );
  }
}
