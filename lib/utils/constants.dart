import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import '../models/cast_model/cast_movie_model.dart';
import '../models/movie_list_model/movie_list_model.dart';
import '../models/movie_model/movie_model.dart';
import '../models/video_model/video_movie_model.dart';

/// Returns a sublist of the given list up to a maximum of 10 elements.
List<MovieListModel> getSubList(List<MovieListModel> list) {
  return list.sublist(0, 10);
}

/// Format a date string in the format "yyyy-MM-dd" into a string in the format
/// "MMM dd, yyyy" (e.g. "2022-01-01" becomes "Jan 01, 2022").
String formatDate(String dateTime) {
  DateTime dateTimeParsed = DateTime.parse(dateTime);
  String formatted = DateFormat("MMM dd, yyyy").format(dateTimeParsed);
  return formatted;
}

MovieModel defaultMovieModel = const MovieModel(
    isAdult: false,
    backdropPath: '',
    budget: 0,
    genres: [],
    homepage: '',
    id: -1,
    imdbId: '',
    originCountry: [],
    originalLanguage: '',
    originalTitle: '',
    overview: '',
    popularity: 0,
    posterPath: '',
    productionCompanies: [],
    productionCountries: [],
    releaseDate: '',
    revenue: 0,
    runtime: 0,
    spokenLanguages: [],
    status: '',
    tagline: '',
    title: '',
    video: false,
    voteAverage: 0,
    voteCount: 0);

CastMovieModel defaultCastMovieModel = CastMovieModel(
  movieId: -1,
  castList: [],
);

VideoMovieModel defaultVideoMovieModel = VideoMovieModel(
  movieId: -1,
  videoModel: []
);

final posterImageCacheManager = CacheManager(
  Config(
    'posterImageCache',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 200,
  ),
);
