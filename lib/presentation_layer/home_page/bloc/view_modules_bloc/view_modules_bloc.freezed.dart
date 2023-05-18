// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_modules_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewModulesState {
  StoreType get storeType =>
      throw _privateConstructorUsedError; // @Default(<Collection>[]) List<Collection> collections,
  ViewModulesStatus get status => throw _privateConstructorUsedError;
  List<ViewModule> get viewModules => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewModulesStateCopyWith<ViewModulesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewModulesStateCopyWith<$Res> {
  factory $ViewModulesStateCopyWith(
          ViewModulesState value, $Res Function(ViewModulesState) then) =
      _$ViewModulesStateCopyWithImpl<$Res, ViewModulesState>;
  @useResult
  $Res call(
      {StoreType storeType,
      ViewModulesStatus status,
      List<ViewModule> viewModules});
}

/// @nodoc
class _$ViewModulesStateCopyWithImpl<$Res, $Val extends ViewModulesState>
    implements $ViewModulesStateCopyWith<$Res> {
  _$ViewModulesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeType = null,
    Object? status = null,
    Object? viewModules = null,
  }) {
    return _then(_value.copyWith(
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as StoreType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewModulesStatus,
      viewModules: null == viewModules
          ? _value.viewModules
          : viewModules // ignore: cast_nullable_to_non_nullable
              as List<ViewModule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewModulesStateCopyWith<$Res>
    implements $ViewModulesStateCopyWith<$Res> {
  factory _$$_ViewModulesStateCopyWith(
          _$_ViewModulesState value, $Res Function(_$_ViewModulesState) then) =
      __$$_ViewModulesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StoreType storeType,
      ViewModulesStatus status,
      List<ViewModule> viewModules});
}

/// @nodoc
class __$$_ViewModulesStateCopyWithImpl<$Res>
    extends _$ViewModulesStateCopyWithImpl<$Res, _$_ViewModulesState>
    implements _$$_ViewModulesStateCopyWith<$Res> {
  __$$_ViewModulesStateCopyWithImpl(
      _$_ViewModulesState _value, $Res Function(_$_ViewModulesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeType = null,
    Object? status = null,
    Object? viewModules = null,
  }) {
    return _then(_$_ViewModulesState(
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as StoreType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ViewModulesStatus,
      viewModules: null == viewModules
          ? _value._viewModules
          : viewModules // ignore: cast_nullable_to_non_nullable
              as List<ViewModule>,
    ));
  }
}

/// @nodoc

class _$_ViewModulesState implements _ViewModulesState {
  _$_ViewModulesState(
      {this.storeType = StoreType.market,
      this.status = ViewModulesStatus.initial,
      final List<ViewModule> viewModules = const <ViewModule>[]})
      : _viewModules = viewModules;

  @override
  @JsonKey()
  final StoreType storeType;
// @Default(<Collection>[]) List<Collection> collections,
  @override
  @JsonKey()
  final ViewModulesStatus status;
  final List<ViewModule> _viewModules;
  @override
  @JsonKey()
  List<ViewModule> get viewModules {
    if (_viewModules is EqualUnmodifiableListView) return _viewModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewModules);
  }

  @override
  String toString() {
    return 'ViewModulesState(storeType: $storeType, status: $status, viewModules: $viewModules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewModulesState &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._viewModules, _viewModules));
  }

  @override
  int get hashCode => Object.hash(runtimeType, storeType, status,
      const DeepCollectionEquality().hash(_viewModules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewModulesStateCopyWith<_$_ViewModulesState> get copyWith =>
      __$$_ViewModulesStateCopyWithImpl<_$_ViewModulesState>(this, _$identity);
}

abstract class _ViewModulesState implements ViewModulesState {
  factory _ViewModulesState(
      {final StoreType storeType,
      final ViewModulesStatus status,
      final List<ViewModule> viewModules}) = _$_ViewModulesState;

  @override
  StoreType get storeType;
  @override // @Default(<Collection>[]) List<Collection> collections,
  ViewModulesStatus get status;
  @override
  List<ViewModule> get viewModules;
  @override
  @JsonKey(ignore: true)
  _$$_ViewModulesStateCopyWith<_$_ViewModulesState> get copyWith =>
      throw _privateConstructorUsedError;
}
