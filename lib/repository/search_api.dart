import '../services/network.dart';
import '../models/movie_list_model/movie_list_model.dart';

class SearchApi {
  final Network _client = Network();

  /// Searches movies with the given query and page and returns a list of [MovieListModel] objects.
  ///
  /// The API endpoint used is [https://api.themoviedb.org/3/search/movie](https://api.themoviedb.org/3/search/movie).
  ///
  /// The [query] parameter is used to specify the query string to search for. The [page] parameter is used to paginate the results.
  ///
  /// Returns a list of [MovieListModel] objects.
  ///
  /// Throws an exception if the request fails.
  Future<List<MovieListModel>> searchMovies(String query, int page) async {
    String searchUrl =
        "https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=$page&api_key=";

    try {
      final Response response = await _client.get(endPoint: searchUrl);
      final List<dynamic> movieData = response.data['results'] as List<dynamic>;
      return movieData.map((e) => MovieListModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
