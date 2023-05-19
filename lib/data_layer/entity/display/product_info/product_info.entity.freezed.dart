// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_info.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductInfoEntity _$ProductInfoEntityFromJson(Map<String, dynamic> json) {
  return _ProductInfoEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductInfoEntity {
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductInfoEntityCopyWith<ProductInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductInfoEntityCopyWith<$Res> {
  factory $ProductInfoEntityCopyWith(
          ProductInfoEntity value, $Res Function(ProductInfoEntity) then) =
      _$ProductInfoEntityCopyWithImpl<$Res, ProductInfoEntity>;
  @useResult
  $Res call({String title, String imageUrl});
}

/// @nodoc
class _$ProductInfoEntityCopyWithImpl<$Res, $Val extends ProductInfoEntity>
    implements $ProductInfoEntityCopyWith<$Res> {
  _$ProductInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductInfoEntityCopyWith<$Res>
    implements $ProductInfoEntityCopyWith<$Res> {
  factory _$$_ProductInfoEntityCopyWith(_$_ProductInfoEntity value,
          $Res Function(_$_ProductInfoEntity) then) =
      __$$_ProductInfoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String imageUrl});
}

/// @nodoc
class __$$_ProductInfoEntityCopyWithImpl<$Res>
    extends _$ProductInfoEntityCopyWithImpl<$Res, _$_ProductInfoEntity>
    implements _$$_ProductInfoEntityCopyWith<$Res> {
  __$$_ProductInfoEntityCopyWithImpl(
      _$_ProductInfoEntity _value, $Res Function(_$_ProductInfoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_ProductInfoEntity(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductInfoEntity implements _ProductInfoEntity {
  const _$_ProductInfoEntity({required this.title, required this.imageUrl});

  factory _$_ProductInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ProductInfoEntityFromJson(json);

  @override
  final String title;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'ProductInfoEntity(title: $title, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductInfoEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductInfoEntityCopyWith<_$_ProductInfoEntity> get copyWith =>
      __$$_ProductInfoEntityCopyWithImpl<_$_ProductInfoEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductInfoEntityToJson(
      this,
    );
  }
}

abstract class _ProductInfoEntity implements ProductInfoEntity {
  const factory _ProductInfoEntity(
      {required final String title,
      required final String imageUrl}) = _$_ProductInfoEntity;

  factory _ProductInfoEntity.fromJson(Map<String, dynamic> json) =
      _$_ProductInfoEntity.fromJson;

  @override
  String get title;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ProductInfoEntityCopyWith<_$_ProductInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
