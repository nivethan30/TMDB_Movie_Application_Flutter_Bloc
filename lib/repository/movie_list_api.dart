import '../models/movie_list_model/movie_list_model.dart';
import '../services/network.dart';

class MovieListApi {
  final Network _client = Network();

  /// Gets a list of popular movies from the Movie Database API.
  ///
  /// The API endpoint used is [https://api.themoviedb.org/3/movie/popular](https://api.themoviedb.org/3/movie/popular).
  ///
  /// The [page] parameter is used to paginate the results.
  ///
  /// Returns a list of [MovieListModel] objects.
  ///
  /// Throws an exception if the request fails.
  Future<List<MovieListModel>> getPopularMovies({required int page}) async {
    String popularUrl =
        "https://api.themoviedb.org/3/movie/popular?page=$page&api_key=";
    try {
      final Response response = await _client.get(endPoint: popularUrl);
      final List<dynamic> movieData = response.data['results'] as List<dynamic>;
      final List<MovieListModel> popularMovies =
          movieData.map((e) => MovieListModel.fromJson(e)).toList();
      return popularMovies;
    } catch (e) {
      rethrow;
    }
  }

  /// Gets a list of top rated movies from the Movie Database API.
  ///
  /// The API endpoint used is [https://api.themoviedb.org/3/movie/top_rated](https://api.themoviedb.org/3/movie/top_rated).
  ///
  /// The [page] parameter is used to paginate the results.
  ///
  /// Returns a list of [MovieListModel] objects.
  ///
  /// Throws an exception if the request fails.
  Future<List<MovieListModel>> getTopRatedMovies({required int page}) async {
    String topRatedUrl =
        "https://api.themoviedb.org/3/movie/top_rated?page=$page&api_key=";
    try {
      final Response response = await _client.get(endPoint: topRatedUrl);
      final List<dynamic> movieData = response.data['results'] as List<dynamic>;
      final List<MovieListModel> topRatedMovies =
          movieData.map((e) => MovieListModel.fromJson(e)).toList();
      return topRatedMovies;
    } catch (e) {
      rethrow;
    }
  }

  /// Gets a list of upcoming movies from the Movie Database API.
  ///
  /// The API endpoint used is [https://api.themoviedb.org/3/movie/upcoming](https://api.themoviedb.org/3/movie/upcoming).
  ///
  /// The [page] parameter is used to paginate the results.
  ///
  /// Returns a list of [MovieListModel] objects.
  ///
  /// Throws an exception if the request fails.
  Future<List<MovieListModel>> getUpcomingMovies({required int page}) async {
    String upcomingUrl =
        "https://api.themoviedb.org/3/movie/upcoming?page=$page&api_key=";
    try {
      final Response response = await _client.get(endPoint: upcomingUrl);
      final List<dynamic> movieData = response.data['results'] as List<dynamic>;
      final List<MovieListModel> upcomingMovies =
          movieData.map((e) => MovieListModel.fromJson(e)).toList();
      return upcomingMovies;
    } catch (e) {
      rethrow;
    }
  }
}
