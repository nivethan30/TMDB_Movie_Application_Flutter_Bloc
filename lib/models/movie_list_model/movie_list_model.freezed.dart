// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) {
  return _MovieListModel.fromJson(json);
}

/// @nodoc
mixin _$MovieListModel {
  @JsonKey(name: 'adult')
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'video')
  bool get video => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int get voteCount => throw _privateConstructorUsedError;

  /// Serializes this MovieListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MovieListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieListModelCopyWith<MovieListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListModelCopyWith<$Res> {
  factory $MovieListModelCopyWith(
          MovieListModel value, $Res Function(MovieListModel) then) =
      _$MovieListModelCopyWithImpl<$Res, MovieListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

/// @nodoc
class _$MovieListModelCopyWithImpl<$Res, $Val extends MovieListModel>
    implements $MovieListModelCopyWith<$Res> {
  _$MovieListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = null,
    Object? id = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = null,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: null == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieListModelImplCopyWith<$Res>
    implements $MovieListModelCopyWith<$Res> {
  factory _$$MovieListModelImplCopyWith(_$MovieListModelImpl value,
          $Res Function(_$MovieListModelImpl) then) =
      __$$MovieListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'poster_path') String? posterPath,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

/// @nodoc
class __$$MovieListModelImplCopyWithImpl<$Res>
    extends _$MovieListModelCopyWithImpl<$Res, _$MovieListModelImpl>
    implements _$$MovieListModelImplCopyWith<$Res> {
  __$$MovieListModelImplCopyWithImpl(
      _$MovieListModelImpl _value, $Res Function(_$MovieListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? backdropPath = freezed,
    Object? genreIds = null,
    Object? id = null,
    Object? originalLanguage = null,
    Object? originalTitle = null,
    Object? overview = null,
    Object? popularity = null,
    Object? posterPath = freezed,
    Object? releaseDate = null,
    Object? title = null,
    Object? video = null,
    Object? voteAverage = null,
    Object? voteCount = null,
  }) {
    return _then(_$MovieListModelImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      genreIds: null == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      originalLanguage: null == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieListModelImpl implements _MovieListModel {
  const _$MovieListModelImpl(
      {@JsonKey(name: 'adult') required this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'genre_ids') required final List<int> genreIds,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'original_language') required this.originalLanguage,
      @JsonKey(name: 'original_title') required this.originalTitle,
      @JsonKey(name: 'overview') required this.overview,
      @JsonKey(name: 'popularity') required this.popularity,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'release_date') required this.releaseDate,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'video') required this.video,
      @JsonKey(name: 'vote_average') required this.voteAverage,
      @JsonKey(name: 'vote_count') required this.voteCount})
      : _genreIds = genreIds;

  factory _$MovieListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListModelImplFromJson(json);

  @override
  @JsonKey(name: 'adult')
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final List<int> _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds {
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genreIds);
  }

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey(name: 'overview')
  final String overview;
  @override
  @JsonKey(name: 'popularity')
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'video')
  final bool video;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @override
  String toString() {
    return 'MovieListModel(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListModelImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      backdropPath,
      const DeepCollectionEquality().hash(_genreIds),
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount);

  /// Create a copy of MovieListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListModelImplCopyWith<_$MovieListModelImpl> get copyWith =>
      __$$MovieListModelImplCopyWithImpl<_$MovieListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListModelImplToJson(
      this,
    );
  }
}

abstract class _MovieListModel implements MovieListModel {
  const factory _MovieListModel(
          {@JsonKey(name: 'adult') required final bool adult,
          @JsonKey(name: 'backdrop_path') final String? backdropPath,
          @JsonKey(name: 'genre_ids') required final List<int> genreIds,
          @JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'original_language')
          required final String originalLanguage,
          @JsonKey(name: 'original_title') required final String originalTitle,
          @JsonKey(name: 'overview') required final String overview,
          @JsonKey(name: 'popularity') required final double popularity,
          @JsonKey(name: 'poster_path') final String? posterPath,
          @JsonKey(name: 'release_date') required final String releaseDate,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'video') required final bool video,
          @JsonKey(name: 'vote_average') required final double voteAverage,
          @JsonKey(name: 'vote_count') required final int voteCount}) =
      _$MovieListModelImpl;

  factory _MovieListModel.fromJson(Map<String, dynamic> json) =
      _$MovieListModelImpl.fromJson;

  @override
  @JsonKey(name: 'adult')
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  @JsonKey(name: 'overview')
  String get overview;
  @override
  @JsonKey(name: 'popularity')
  double get popularity;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'video')
  bool get video;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;

  /// Create a copy of MovieListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieListModelImplCopyWith<_$MovieListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
