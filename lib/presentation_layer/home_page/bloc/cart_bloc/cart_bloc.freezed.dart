// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  CartStatus get status => throw _privateConstructorUsedError;
  String get errorMsg => throw _privateConstructorUsedError;
  ProductInfo get productInfo => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {CartStatus status,
      String errorMsg,
      ProductInfo productInfo,
      int quantity,
      int totalPrice});

  $ProductInfoCopyWith<$Res> get productInfo;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMsg = null,
    Object? productInfo = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartStatus,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      productInfo: null == productInfo
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as ProductInfo,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductInfoCopyWith<$Res> get productInfo {
    return $ProductInfoCopyWith<$Res>(_value.productInfo, (value) {
      return _then(_value.copyWith(productInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewModulesStateCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$_ViewModulesStateCopyWith(
          _$_ViewModulesState value, $Res Function(_$_ViewModulesState) then) =
      __$$_ViewModulesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CartStatus status,
      String errorMsg,
      ProductInfo productInfo,
      int quantity,
      int totalPrice});

  @override
  $ProductInfoCopyWith<$Res> get productInfo;
}

/// @nodoc
class __$$_ViewModulesStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_ViewModulesState>
    implements _$$_ViewModulesStateCopyWith<$Res> {
  __$$_ViewModulesStateCopyWithImpl(
      _$_ViewModulesState _value, $Res Function(_$_ViewModulesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMsg = null,
    Object? productInfo = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_$_ViewModulesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartStatus,
      errorMsg: null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      productInfo: null == productInfo
          ? _value.productInfo
          : productInfo // ignore: cast_nullable_to_non_nullable
              as ProductInfo,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ViewModulesState implements _ViewModulesState {
  _$_ViewModulesState(
      {this.status = CartStatus.close,
      this.errorMsg = '',
      this.productInfo = const ProductInfo(
          productId: '',
          title: '',
          imageUrl: '',
          subtitle: '',
          price: -1,
          originalPrice: -1,
          discountRate: -1,
          reviewCount: -1),
      this.quantity = 1,
      this.totalPrice = 0});

  @override
  @JsonKey()
  final CartStatus status;
  @override
  @JsonKey()
  final String errorMsg;
  @override
  @JsonKey()
  final ProductInfo productInfo;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int totalPrice;

  @override
  String toString() {
    return 'CartState(status: $status, errorMsg: $errorMsg, productInfo: $productInfo, quantity: $quantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewModulesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.productInfo, productInfo) ||
                other.productInfo == productInfo) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, errorMsg, productInfo, quantity, totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewModulesStateCopyWith<_$_ViewModulesState> get copyWith =>
      __$$_ViewModulesStateCopyWithImpl<_$_ViewModulesState>(this, _$identity);
}

abstract class _ViewModulesState implements CartState {
  factory _ViewModulesState(
      {final CartStatus status,
      final String errorMsg,
      final ProductInfo productInfo,
      final int quantity,
      final int totalPrice}) = _$_ViewModulesState;

  @override
  CartStatus get status;
  @override
  String get errorMsg;
  @override
  ProductInfo get productInfo;
  @override
  int get quantity;
  @override
  int get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$_ViewModulesStateCopyWith<_$_ViewModulesState> get copyWith =>
      throw _privateConstructorUsedError;
}
