// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DisplayApi implements DisplayApi {
  _DisplayApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://localhost:8080/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseWrapper<List<CollectionDto>>> getCollectionsByStoreType(
      {required storeType}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseWrapper<List<CollectionDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/stores/${storeType}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseWrapper<List<CollectionDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<CollectionDto>(
              (i) => CollectionDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>>
      getViewModulesByStoreTypeAndTabId({
    required storeType,
    required tabId,
    required page,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseWrapper<List<ViewModuleDto>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/view_modules/${storeType}/${tabId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseWrapper<List<ViewModuleDto>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ViewModuleDto>(
              (i) => ViewModuleDto.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
