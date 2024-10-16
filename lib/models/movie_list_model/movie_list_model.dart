import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_model.freezed.dart';
part 'movie_list_model.g.dart';

@freezed
class MovieListModel with _$MovieListModel {
  const factory MovieListModel({
    @JsonKey(name: 'adult') required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'popularity') required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'video') required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);
}
