import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_model.freezed.dart';
part 'cast_model.g.dart';

@freezed
class CastModel with _$CastModel {
  const factory CastModel({
    @JsonKey(name: 'adult') required bool isAdult,
    @JsonKey(name: 'gender') required int gender,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'original_name') required String originalName,
    @JsonKey(name: 'popularity') required double popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
    @JsonKey(name: 'cast_id') required int castId,
    @JsonKey(name: 'character') required String character,
    @JsonKey(name: 'credit_id') required String creditId,
    @JsonKey(name: 'order') required int order,
  }) = _CastModel;

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);
}
