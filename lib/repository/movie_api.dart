import '../models/movie_model/movie_model.dart';
import '../services/network.dart';

class MovieApi {
  final Network _client = Network();

  /// Gets the movie details for a given movie id
  ///
  /// Throws: [Exception] if there is an error in the network call
  ///
  Future<MovieModel> getMovieDetails(int movieId) async {
    String movieUrl = "https://api.themoviedb.org/3/movie/$movieId?api_key=";
    try {
      Response reponse = await _client.get(endPoint: movieUrl);
      return MovieModel.fromJson(reponse.data);
    } catch (e) {
      rethrow;
    }
  }
}
