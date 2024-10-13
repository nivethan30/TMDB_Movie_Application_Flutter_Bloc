// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CastModel _$CastModelFromJson(Map<String, dynamic> json) {
  return _CastModel.fromJson(json);
}

/// @nodoc
mixin _$CastModel {
  @JsonKey(name: 'adult')
  bool get isAdult => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'cast_id')
  int get castId => throw _privateConstructorUsedError;
  @JsonKey(name: 'character')
  String get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int get order => throw _privateConstructorUsedError;

  /// Serializes this CastModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CastModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CastModelCopyWith<CastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastModelCopyWith<$Res> {
  factory $CastModelCopyWith(CastModel value, $Res Function(CastModel) then) =
      _$CastModelCopyWithImpl<$Res, CastModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool isAdult,
      @JsonKey(name: 'gender') int gender,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int castId,
      @JsonKey(name: 'character') String character,
      @JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'order') int order});
}

/// @nodoc
class _$CastModelCopyWithImpl<$Res, $Val extends CastModel>
    implements $CastModelCopyWith<$Res> {
  _$CastModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CastModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdult = null,
    Object? gender = null,
    Object? id = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = null,
    Object? character = null,
    Object? creditId = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: null == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CastModelImplCopyWith<$Res>
    implements $CastModelCopyWith<$Res> {
  factory _$$CastModelImplCopyWith(
          _$CastModelImpl value, $Res Function(_$CastModelImpl) then) =
      __$$CastModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool isAdult,
      @JsonKey(name: 'gender') int gender,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'known_for_department') String knownForDepartment,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int castId,
      @JsonKey(name: 'character') String character,
      @JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'order') int order});
}

/// @nodoc
class __$$CastModelImplCopyWithImpl<$Res>
    extends _$CastModelCopyWithImpl<$Res, _$CastModelImpl>
    implements _$$CastModelImplCopyWith<$Res> {
  __$$CastModelImplCopyWithImpl(
      _$CastModelImpl _value, $Res Function(_$CastModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CastModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdult = null,
    Object? gender = null,
    Object? id = null,
    Object? knownForDepartment = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = null,
    Object? character = null,
    Object? creditId = null,
    Object? order = null,
  }) {
    return _then(_$CastModelImpl(
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      knownForDepartment: null == knownForDepartment
          ? _value.knownForDepartment
          : knownForDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: null == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CastModelImpl implements _CastModel {
  const _$CastModelImpl(
      {@JsonKey(name: 'adult') required this.isAdult,
      @JsonKey(name: 'gender') required this.gender,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'known_for_department') required this.knownForDepartment,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'popularity') required this.popularity,
      @JsonKey(name: 'profile_path') this.profilePath,
      @JsonKey(name: 'cast_id') required this.castId,
      @JsonKey(name: 'character') required this.character,
      @JsonKey(name: 'credit_id') required this.creditId,
      @JsonKey(name: 'order') required this.order});

  factory _$CastModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastModelImplFromJson(json);

  @override
  @JsonKey(name: 'adult')
  final bool isAdult;
  @override
  @JsonKey(name: 'gender')
  final int gender;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  @JsonKey(name: 'popularity')
  final double popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  @JsonKey(name: 'cast_id')
  final int castId;
  @override
  @JsonKey(name: 'character')
  final String character;
  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  @JsonKey(name: 'order')
  final int order;

  @override
  String toString() {
    return 'CastModel(isAdult: $isAdult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastModelImpl &&
            (identical(other.isAdult, isAdult) || other.isAdult == isAdult) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.knownForDepartment, knownForDepartment) ||
                other.knownForDepartment == knownForDepartment) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.castId, castId) || other.castId == castId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAdult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId,
      order);

  /// Create a copy of CastModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CastModelImplCopyWith<_$CastModelImpl> get copyWith =>
      __$$CastModelImplCopyWithImpl<_$CastModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastModelImplToJson(
      this,
    );
  }
}

abstract class _CastModel implements CastModel {
  const factory _CastModel(
      {@JsonKey(name: 'adult') required final bool isAdult,
      @JsonKey(name: 'gender') required final int gender,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'known_for_department')
      required final String knownForDepartment,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'original_name') required final String originalName,
      @JsonKey(name: 'popularity') required final double popularity,
      @JsonKey(name: 'profile_path') final String? profilePath,
      @JsonKey(name: 'cast_id') required final int castId,
      @JsonKey(name: 'character') required final String character,
      @JsonKey(name: 'credit_id') required final String creditId,
      @JsonKey(name: 'order') required final int order}) = _$CastModelImpl;

  factory _CastModel.fromJson(Map<String, dynamic> json) =
      _$CastModelImpl.fromJson;

  @override
  @JsonKey(name: 'adult')
  bool get isAdult;
  @override
  @JsonKey(name: 'gender')
  int get gender;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'known_for_department')
  String get knownForDepartment;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  @JsonKey(name: 'popularity')
  double get popularity;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(name: 'cast_id')
  int get castId;
  @override
  @JsonKey(name: 'character')
  String get character;
  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  @JsonKey(name: 'order')
  int get order;

  /// Create a copy of CastModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CastModelImplCopyWith<_$CastModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
