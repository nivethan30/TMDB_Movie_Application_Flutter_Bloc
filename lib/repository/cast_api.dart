import '../models/cast_model/cast_model.dart';
import '../services/network.dart';

class CastApi {
  final Network _client = Network();

  /// Gets the list of cast details for a given movie id
  ///
  /// Throws: [Exception] if there is an error in the network call
  ///
  Future<List<CastModel>> getCastDetails(int movieId) async {
    String castUrl =
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=";
    try {
      Response response = await _client.get(endPoint: castUrl);
      List<dynamic> castResponse = response.data['cast'] as List<dynamic>;
      List<CastModel> casts =
          castResponse.map((e) => CastModel.fromJson(e)).toList();
      return casts;
    } catch (e) {
      rethrow;
    }
  }
}
