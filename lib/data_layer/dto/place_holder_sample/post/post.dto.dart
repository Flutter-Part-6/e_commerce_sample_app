import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post.dto.freezed.dart';

part 'post.dto.g.dart';

@freezed
class PostDto with _$PostDto {
  const factory PostDto({
    @Default(0) int? userId,
    @Default(0) int? id,
    @Default('') String? title,
    @Default('') String? body,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, Object?> json) =>
      _$PostDtoFromJson(json);
}
