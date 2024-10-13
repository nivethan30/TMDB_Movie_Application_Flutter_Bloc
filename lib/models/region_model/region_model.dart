import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.freezed.dart';
part 'region_model.g.dart';

@freezed
class RegionModel with _$RegionModel {
  const factory RegionModel({
    @JsonKey(name: 'iso_3166_1') required String iso31661,
    @JsonKey(name: 'english_name') required String englishName,
    @JsonKey(name: 'native_name') required String nativeName,
  }) = _RegionModel;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);
}
