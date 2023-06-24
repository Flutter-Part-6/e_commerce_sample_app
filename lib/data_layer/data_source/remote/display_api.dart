import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/display.dto.dart';
import '../../dto/response_wrapper/response_wrapper.dart';

part 'display_api.g.dart';

@RestApi()
abstract class DisplayApi {
  factory DisplayApi(Dio dio, {String? baseUrl}) = _DisplayApi;

  // about collections
  @GET('/stores/{mallType}')
  Future<ResponseWrapper<List<CollectionDto>>> getCollectionsByMallType({
    @Path('mallType') required String mallType,
  });

  // about view_modules
  @GET('/view_modules/{mallType}/{tabId}')
  Future<ResponseWrapper<List<ViewModuleDto>>>
      getViewModulesByMallTypeAndTabId({
    @Path('mallType') required String mallType,
    @Path('tabId') required int tabId,
    @Query('page') required int page,
  });
}
