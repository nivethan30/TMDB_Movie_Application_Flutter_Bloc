// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegionModelImpl _$$RegionModelImplFromJson(Map<String, dynamic> json) =>
    _$RegionModelImpl(
      iso31661: json['iso_3166_1'] as String,
      englishName: json['english_name'] as String,
      nativeName: json['native_name'] as String,
    );

Map<String, dynamic> _$$RegionModelImplToJson(_$RegionModelImpl instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'english_name': instance.englishName,
      'native_name': instance.nativeName,
    };
