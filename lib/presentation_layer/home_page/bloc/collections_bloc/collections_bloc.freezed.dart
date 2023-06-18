// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collections_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CollectionsState {
  Status get status => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  StoreType get storeType => throw _privateConstructorUsedError;
  int get currentTabId => throw _privateConstructorUsedError;
  List<Collection> get collections => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CollectionsStateCopyWith<CollectionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionsStateCopyWith<$Res> {
  factory $CollectionsStateCopyWith(
          CollectionsState value, $Res Function(CollectionsState) then) =
      _$CollectionsStateCopyWithImpl<$Res, CollectionsState>;
  @useResult
  $Res call(
      {Status status,
      String errorMsg,
      StoreType storeType,
      int currentTabId,
      List<Collection> collections});
}

/// @nodoc
class _$CollectionsStateCopyWithImpl<$Res, $Val extends CollectionsState>
    implements $CollectionsStateCopyWith<$Res> {
  _$CollectionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMsg = null,
    Object? storeType = null,
    Object? currentTabId = null,
    Object? collections = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as StoreType,
      currentTabId: null == currentTabId
          ? _value.currentTabId
          : currentTabId // ignore: cast_nullable_to_non_nullable
              as int,
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CollectionsStateCopyWith<$Res>
    implements $CollectionsStateCopyWith<$Res> {
  factory _$$_CollectionsStateCopyWith(
          _$_CollectionsState value, $Res Function(_$_CollectionsState) then) =
      __$$_CollectionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String errorMsg,
      StoreType storeType,
      int currentTabId,
      List<Collection> collections});
}

/// @nodoc
class __$$_CollectionsStateCopyWithImpl<$Res>
    extends _$CollectionsStateCopyWithImpl<$Res, _$_CollectionsState>
    implements _$$_CollectionsStateCopyWith<$Res> {
  __$$_CollectionsStateCopyWithImpl(
      _$_CollectionsState _value, $Res Function(_$_CollectionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMsg = null,
    Object? storeType = null,
    Object? currentTabId = null,
    Object? collections = null,
  }) {
    return _then(_$_CollectionsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as StoreType,
      currentTabId: null == currentTabId
          ? _value.currentTabId
          : currentTabId // ignore: cast_nullable_to_non_nullable
              as int,
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
    ));
  }
}

/// @nodoc

class _$_CollectionsState implements _CollectionsState {
  _$_CollectionsState(
      {this.status = Status.initial,
      this.errorMsg = '',
      this.storeType = StoreType.market,
      this.currentTabId = 0,
      final List<Collection> collections = const <Collection>[]})
      : _collections = collections;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMsg;
  @override
  @JsonKey()
  final StoreType storeType;
  @override
  @JsonKey()
  final int currentTabId;
  final List<Collection> _collections;
  @override
  @JsonKey()
  List<Collection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  String toString() {
    return 'CollectionsState(status: $status, errorMsg: $errorMsg, storeType: $storeType, currentTabId: $currentTabId, collections: $collections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CollectionsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.currentTabId, currentTabId) ||
                other.currentTabId == currentTabId) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMsg, storeType,
      currentTabId, const DeepCollectionEquality().hash(_collections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollectionsStateCopyWith<_$_CollectionsState> get copyWith =>
      __$$_CollectionsStateCopyWithImpl<_$_CollectionsState>(this, _$identity);
}

abstract class _CollectionsState implements CollectionsState {
  factory _CollectionsState(
      {final Status status,
      final String errorMsg,
      final StoreType storeType,
      final int currentTabId,
      final List<Collection> collections}) = _$_CollectionsState;

  @override
  Status get status;
  @override
  String get errorMsg;
  @override
  StoreType get storeType;
  @override
  int get currentTabId;
  @override
  List<Collection> get collections;
  @override
  @JsonKey(ignore: true)
  _$$_CollectionsStateCopyWith<_$_CollectionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
