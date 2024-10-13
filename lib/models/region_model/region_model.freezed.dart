// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) {
  return _RegionModel.fromJson(json);
}

/// @nodoc
mixin _$RegionModel {
  @JsonKey(name: 'iso_3166_1')
  String get iso31661 => throw _privateConstructorUsedError;
  @JsonKey(name: 'english_name')
  String get englishName => throw _privateConstructorUsedError;
  @JsonKey(name: 'native_name')
  String get nativeName => throw _privateConstructorUsedError;

  /// Serializes this RegionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionModelCopyWith<RegionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionModelCopyWith<$Res> {
  factory $RegionModelCopyWith(
          RegionModel value, $Res Function(RegionModel) then) =
      _$RegionModelCopyWithImpl<$Res, RegionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_3166_1') String iso31661,
      @JsonKey(name: 'english_name') String englishName,
      @JsonKey(name: 'native_name') String nativeName});
}

/// @nodoc
class _$RegionModelCopyWithImpl<$Res, $Val extends RegionModel>
    implements $RegionModelCopyWith<$Res> {
  _$RegionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso31661 = null,
    Object? englishName = null,
    Object? nativeName = null,
  }) {
    return _then(_value.copyWith(
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      nativeName: null == nativeName
          ? _value.nativeName
          : nativeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionModelImplCopyWith<$Res>
    implements $RegionModelCopyWith<$Res> {
  factory _$$RegionModelImplCopyWith(
          _$RegionModelImpl value, $Res Function(_$RegionModelImpl) then) =
      __$$RegionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_3166_1') String iso31661,
      @JsonKey(name: 'english_name') String englishName,
      @JsonKey(name: 'native_name') String nativeName});
}

/// @nodoc
class __$$RegionModelImplCopyWithImpl<$Res>
    extends _$RegionModelCopyWithImpl<$Res, _$RegionModelImpl>
    implements _$$RegionModelImplCopyWith<$Res> {
  __$$RegionModelImplCopyWithImpl(
      _$RegionModelImpl _value, $Res Function(_$RegionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso31661 = null,
    Object? englishName = null,
    Object? nativeName = null,
  }) {
    return _then(_$RegionModelImpl(
      iso31661: null == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      nativeName: null == nativeName
          ? _value.nativeName
          : nativeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionModelImpl implements _RegionModel {
  const _$RegionModelImpl(
      {@JsonKey(name: 'iso_3166_1') required this.iso31661,
      @JsonKey(name: 'english_name') required this.englishName,
      @JsonKey(name: 'native_name') required this.nativeName});

  factory _$RegionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionModelImplFromJson(json);

  @override
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  @override
  @JsonKey(name: 'english_name')
  final String englishName;
  @override
  @JsonKey(name: 'native_name')
  final String nativeName;

  @override
  String toString() {
    return 'RegionModel(iso31661: $iso31661, englishName: $englishName, nativeName: $nativeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionModelImpl &&
            (identical(other.iso31661, iso31661) ||
                other.iso31661 == iso31661) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.nativeName, nativeName) ||
                other.nativeName == nativeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, iso31661, englishName, nativeName);

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      __$$RegionModelImplCopyWithImpl<_$RegionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionModelImplToJson(
      this,
    );
  }
}

abstract class _RegionModel implements RegionModel {
  const factory _RegionModel(
          {@JsonKey(name: 'iso_3166_1') required final String iso31661,
          @JsonKey(name: 'english_name') required final String englishName,
          @JsonKey(name: 'native_name') required final String nativeName}) =
      _$RegionModelImpl;

  factory _RegionModel.fromJson(Map<String, dynamic> json) =
      _$RegionModelImpl.fromJson;

  @override
  @JsonKey(name: 'iso_3166_1')
  String get iso31661;
  @override
  @JsonKey(name: 'english_name')
  String get englishName;
  @override
  @JsonKey(name: 'native_name')
  String get nativeName;

  /// Create a copy of RegionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionModelImplCopyWith<_$RegionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
