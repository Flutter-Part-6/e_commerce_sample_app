import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// dto
import 'package:sample_app/data_layer/dto/display.dto.dart';
import '../mock/moc_api.dart';

part 'display_api.g.dart';

const String _baseUrl = 'http://localhost:8080/';
// const String _baseUrl = 'https://f8a5f7112741bd.lhr.life';

@RestApi(baseUrl: _baseUrl)
abstract class DisplayApi {
  factory DisplayApi(Dio dio, {String? baseUrl}) = _DisplayApi;

  factory DisplayApi.mock() = MockApi;

  // about collections
  @GET('/stores/{storeType}')
  Future<List<CollectionDto>> getCollectionsByStoreType({
    @Path('storeType') required String storeType,
  });

  // about view_modules
  @GET('/view_modules/{storeType}/{tabId}')
  Future<List<ViewModuleDto>> getViewModulesByStoreTypeAndTabId({
    @Path('storeType') required String storeType,
    @Path('tabId') required int tabId,
    @Query('page') required int page,
  });
}
