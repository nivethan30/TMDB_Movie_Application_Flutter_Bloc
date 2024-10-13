import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    @JsonKey(name: 'iso_639_1') required String iso6391,
    @JsonKey(name: 'iso_3166_1') required String iso3166_1,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'key') required String key,
    @JsonKey(name: 'site') required String site,
    @JsonKey(name: 'size') required int size,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'official') required bool official,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    @JsonKey(name: 'id') required String id,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
}
