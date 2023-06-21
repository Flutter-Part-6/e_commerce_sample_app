import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/api_response/response_wrapper.dart';
import '../../dto/display.dto.dart';

part 'display_api.g.dart';

@RestApi()
abstract class DisplayApi {
  factory DisplayApi(Dio dio, {String? baseUrl}) = _DisplayApi;

  // about collections
  @GET('/stores/{storeType}')
  Future<ResponseWrapper<List<CollectionDto>>> getCollectionsByStoreType({
    @Path('storeType') required String storeType,
  });

  // about view_modules
  @GET('/view_modules/{storeType}/{tabId}')
  Future<ResponseWrapper<List<ViewModuleDto>>>
      getViewModulesByStoreTypeAndTabId({
    @Path('storeType') required String storeType,
    @Path('tabId') required int tabId,
    @Query('page') required int page,
  });
}
