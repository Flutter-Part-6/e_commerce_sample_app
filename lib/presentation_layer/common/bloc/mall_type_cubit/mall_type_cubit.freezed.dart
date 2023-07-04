// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mall_type_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MallTypeState {
  MallType get mallType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MallTypeStateCopyWith<MallTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MallTypeStateCopyWith<$Res> {
  factory $MallTypeStateCopyWith(
          MallTypeState value, $Res Function(MallTypeState) then) =
      _$MallTypeStateCopyWithImpl<$Res, MallTypeState>;
  @useResult
  $Res call({MallType mallType});
}

/// @nodoc
class _$MallTypeStateCopyWithImpl<$Res, $Val extends MallTypeState>
    implements $MallTypeStateCopyWith<$Res> {
  _$MallTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mallType = null,
  }) {
    return _then(_value.copyWith(
      mallType: null == mallType
          ? _value.mallType
          : mallType // ignore: cast_nullable_to_non_nullable
              as MallType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MallTypeStateCopyWith<$Res>
    implements $MallTypeStateCopyWith<$Res> {
  factory _$$_MallTypeStateCopyWith(
          _$_MallTypeState value, $Res Function(_$_MallTypeState) then) =
      __$$_MallTypeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MallType mallType});
}

/// @nodoc
class __$$_MallTypeStateCopyWithImpl<$Res>
    extends _$MallTypeStateCopyWithImpl<$Res, _$_MallTypeState>
    implements _$$_MallTypeStateCopyWith<$Res> {
  __$$_MallTypeStateCopyWithImpl(
      _$_MallTypeState _value, $Res Function(_$_MallTypeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mallType = null,
  }) {
    return _then(_$_MallTypeState(
      null == mallType
          ? _value.mallType
          : mallType // ignore: cast_nullable_to_non_nullable
              as MallType,
    ));
  }
}

/// @nodoc

class _$_MallTypeState implements _MallTypeState {
  _$_MallTypeState(this.mallType);

  @override
  final MallType mallType;

  @override
  String toString() {
    return 'MallTypeState(mallType: $mallType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MallTypeState &&
            (identical(other.mallType, mallType) ||
                other.mallType == mallType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mallType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MallTypeStateCopyWith<_$_MallTypeState> get copyWith =>
      __$$_MallTypeStateCopyWithImpl<_$_MallTypeState>(this, _$identity);
}

abstract class _MallTypeState implements MallTypeState {
  factory _MallTypeState(final MallType mallType) = _$_MallTypeState;

  @override
  MallType get mallType;
  @override
  @JsonKey(ignore: true)
  _$$_MallTypeStateCopyWith<_$_MallTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}
