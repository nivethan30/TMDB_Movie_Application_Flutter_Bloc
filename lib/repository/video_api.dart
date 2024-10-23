import '../models/video_model/video_model.dart';
import '../services/network.dart';

class VideoApi {
  final Network _client = Network();

  /// Fetches a list of videos related to a movie from the Movie Database API.
  ///
  /// The [movieId] parameter is the id of the movie to fetch the videos for.
  ///
  /// If the fetch is successful, it returns a [List] of [VideoModel] objects.
  /// If the fetch fails, it rethrows the error.
  Future<List<VideoModel>> fetchMovieVideos(int movieId) async {
    String videoUrl =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=";
    try {
      Response response = await _client.get(endPoint: videoUrl);
      final List<dynamic> videoData = response.data['results'] as List<dynamic>;
      final List<VideoModel> videos =
          videoData.map((e) => VideoModel.fromJson(e)).toList();
      return videos;
    } catch (e) {
      rethrow;
    }
  }
}
