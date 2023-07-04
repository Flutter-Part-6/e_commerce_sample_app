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
  Status get status => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  MallType get mallType => throw _privateConstructorUsedError;
  int get tabId => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get endOfPage => throw _privateConstructorUsedError;
  List<Widget> get viewModules => throw _privateConstructorUsedError;

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
      {Status status,
      String errorMsg,
      MallType mallType,
      int tabId,
      int currentPage,
      bool endOfPage,
      List<Widget> viewModules});
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
    Object? status = null,
    Object? errorMsg = null,
    Object? mallType = null,
    Object? tabId = null,
    Object? currentPage = null,
    Object? endOfPage = null,
    Object? viewModules = null,
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
      mallType: null == mallType
          ? _value.mallType
          : mallType // ignore: cast_nullable_to_non_nullable
              as MallType,
      tabId: null == tabId
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      endOfPage: null == endOfPage
          ? _value.endOfPage
          : endOfPage // ignore: cast_nullable_to_non_nullable
              as bool,
      viewModules: null == viewModules
          ? _value.viewModules
          : viewModules // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
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
      {Status status,
      String errorMsg,
      MallType mallType,
      int tabId,
      int currentPage,
      bool endOfPage,
      List<Widget> viewModules});
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
    Object? status = null,
    Object? errorMsg = null,
    Object? mallType = null,
    Object? tabId = null,
    Object? currentPage = null,
    Object? endOfPage = null,
    Object? viewModules = null,
  }) {
    return _then(_$_ViewModulesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      mallType: null == mallType
          ? _value.mallType
          : mallType // ignore: cast_nullable_to_non_nullable
              as MallType,
      tabId: null == tabId
          ? _value.tabId
          : tabId // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      endOfPage: null == endOfPage
          ? _value.endOfPage
          : endOfPage // ignore: cast_nullable_to_non_nullable
              as bool,
      viewModules: null == viewModules
          ? _value._viewModules
          : viewModules // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc

class _$_ViewModulesState implements _ViewModulesState {
  _$_ViewModulesState(
      {this.status = Status.initial,
      this.errorMsg = '',
      this.mallType = MallType.market,
      this.tabId = 0,
      this.currentPage = 1,
      this.endOfPage = false,
      final List<Widget> viewModules = const <Widget>[]})
      : _viewModules = viewModules;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMsg;
  @override
  @JsonKey()
  final MallType mallType;
  @override
  @JsonKey()
  final int tabId;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool endOfPage;
  final List<Widget> _viewModules;
  @override
  @JsonKey()
  List<Widget> get viewModules {
    if (_viewModules is EqualUnmodifiableListView) return _viewModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_viewModules);
  }

  @override
  String toString() {
    return 'ViewModulesState(status: $status, errorMsg: $errorMsg, mallType: $mallType, tabId: $tabId, currentPage: $currentPage, endOfPage: $endOfPage, viewModules: $viewModules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewModulesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.mallType, mallType) ||
                other.mallType == mallType) &&
            (identical(other.tabId, tabId) || other.tabId == tabId) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.endOfPage, endOfPage) ||
                other.endOfPage == endOfPage) &&
            const DeepCollectionEquality()
                .equals(other._viewModules, _viewModules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      errorMsg,
      mallType,
      tabId,
      currentPage,
      endOfPage,
      const DeepCollectionEquality().hash(_viewModules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewModulesStateCopyWith<_$_ViewModulesState> get copyWith =>
      __$$_ViewModulesStateCopyWithImpl<_$_ViewModulesState>(this, _$identity);
}

abstract class _ViewModulesState implements ViewModulesState {
  factory _ViewModulesState(
      {final Status status,
      final String errorMsg,
      final MallType mallType,
      final int tabId,
      final int currentPage,
      final bool endOfPage,
      final List<Widget> viewModules}) = _$_ViewModulesState;

  @override
  Status get status;
  @override
  String get errorMsg;
  @override
  MallType get mallType;
  @override
  int get tabId;
  @override
  int get currentPage;
  @override
  bool get endOfPage;
  @override
  List<Widget> get viewModules;
  @override
  @JsonKey(ignore: true)
  _$$_ViewModulesStateCopyWith<_$_ViewModulesState> get copyWith =>
      throw _privateConstructorUsedError;
}
