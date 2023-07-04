// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SampleDto _$SampleDtoFromJson(Map<String, dynamic> json) {
  return _SampleDto.fromJson(json);
}

/// @nodoc
mixin _$SampleDto {
  String get aa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SampleDtoCopyWith<SampleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleDtoCopyWith<$Res> {
  factory $SampleDtoCopyWith(SampleDto value, $Res Function(SampleDto) then) =
      _$SampleDtoCopyWithImpl<$Res, SampleDto>;
  @useResult
  $Res call({String aa});
}

/// @nodoc
class _$SampleDtoCopyWithImpl<$Res, $Val extends SampleDto>
    implements $SampleDtoCopyWith<$Res> {
  _$SampleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aa = null,
  }) {
    return _then(_value.copyWith(
      aa: null == aa
          ? _value.aa
          : aa // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SampleDtoCopyWith<$Res> implements $SampleDtoCopyWith<$Res> {
  factory _$$_SampleDtoCopyWith(
          _$_SampleDto value, $Res Function(_$_SampleDto) then) =
      __$$_SampleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String aa});
}

/// @nodoc
class __$$_SampleDtoCopyWithImpl<$Res>
    extends _$SampleDtoCopyWithImpl<$Res, _$_SampleDto>
    implements _$$_SampleDtoCopyWith<$Res> {
  __$$_SampleDtoCopyWithImpl(
      _$_SampleDto _value, $Res Function(_$_SampleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aa = null,
  }) {
    return _then(_$_SampleDto(
      aa: null == aa
          ? _value.aa
          : aa // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SampleDto implements _SampleDto {
  const _$_SampleDto({this.aa = ''});

  factory _$_SampleDto.fromJson(Map<String, dynamic> json) =>
      _$$_SampleDtoFromJson(json);

  @override
  @JsonKey()
  final String aa;

  @override
  String toString() {
    return 'SampleDto(aa: $aa)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SampleDto &&
            (identical(other.aa, aa) || other.aa == aa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SampleDtoCopyWith<_$_SampleDto> get copyWith =>
      __$$_SampleDtoCopyWithImpl<_$_SampleDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SampleDtoToJson(
      this,
    );
  }
}

abstract class _SampleDto implements SampleDto {
  const factory _SampleDto({final String aa}) = _$_SampleDto;

  factory _SampleDto.fromJson(Map<String, dynamic> json) =
      _$_SampleDto.fromJson;

  @override
  String get aa;
  @override
  @JsonKey(ignore: true)
  _$$_SampleDtoCopyWith<_$_SampleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
