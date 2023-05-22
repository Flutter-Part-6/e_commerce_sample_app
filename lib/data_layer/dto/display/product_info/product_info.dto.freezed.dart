// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_info.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductInfoDto _$ProductInfoDtoFromJson(Map<String, dynamic> json) {
  return _ProductInfoDto.fromJson(json);
}

/// @nodoc
mixin _$ProductInfoDto {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductInfoDtoCopyWith<ProductInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductInfoDtoCopyWith<$Res> {
  factory $ProductInfoDtoCopyWith(
          ProductInfoDto value, $Res Function(ProductInfoDto) then) =
      _$ProductInfoDtoCopyWithImpl<$Res, ProductInfoDto>;
  @useResult
  $Res call({String? title, String? subtitle, int? price, String? imageUrl});
}

/// @nodoc
class _$ProductInfoDtoCopyWithImpl<$Res, $Val extends ProductInfoDto>
    implements $ProductInfoDtoCopyWith<$Res> {
  _$ProductInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? price = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductInfoDtoCopyWith<$Res>
    implements $ProductInfoDtoCopyWith<$Res> {
  factory _$$_ProductInfoDtoCopyWith(
          _$_ProductInfoDto value, $Res Function(_$_ProductInfoDto) then) =
      __$$_ProductInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? subtitle, int? price, String? imageUrl});
}

/// @nodoc
class __$$_ProductInfoDtoCopyWithImpl<$Res>
    extends _$ProductInfoDtoCopyWithImpl<$Res, _$_ProductInfoDto>
    implements _$$_ProductInfoDtoCopyWith<$Res> {
  __$$_ProductInfoDtoCopyWithImpl(
      _$_ProductInfoDto _value, $Res Function(_$_ProductInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? price = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_ProductInfoDto(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: freezed == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductInfoDto implements _ProductInfoDto {
  const _$_ProductInfoDto(
      {this.title = '',
      this.subtitle = '',
      this.price = 0,
      this.imageUrl = ''});

  factory _$_ProductInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductInfoDtoFromJson(json);

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? subtitle;
  @override
  @JsonKey()
  final int? price;
  @override
  @JsonKey()
  final String? imageUrl;

  @override
  String toString() {
    return 'ProductInfoDto(title: $title, subtitle: $subtitle, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductInfoDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, subtitle, price, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductInfoDtoCopyWith<_$_ProductInfoDto> get copyWith =>
      __$$_ProductInfoDtoCopyWithImpl<_$_ProductInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductInfoDtoToJson(
      this,
    );
  }
}

abstract class _ProductInfoDto implements ProductInfoDto {
  const factory _ProductInfoDto(
      {final String? title,
      final String? subtitle,
      final int? price,
      final String? imageUrl}) = _$_ProductInfoDto;

  factory _ProductInfoDto.fromJson(Map<String, dynamic> json) =
      _$_ProductInfoDto.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  int? get price;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ProductInfoDtoCopyWith<_$_ProductInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
