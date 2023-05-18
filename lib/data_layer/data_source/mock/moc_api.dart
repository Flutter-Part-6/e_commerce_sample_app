import '../../dto/display/collection/collection.dto.dart';
import '../../dto/display/view_module/view_module.dto.dart';
import '../remote/display_api.dart';

class MockApi implements DisplayApi {
  @override
  Future<List<CollectionDto>> getCollectionsByStoreType(
      {required String storeType}) {
    return Future(() => <CollectionDto>[]);
  }

  @override
  Future<List<ViewModuleDto>> getViewModulesByStoreTypeAndTabId(
      {required String storeType, required int tabId}) {
    return Future(() => <ViewModuleDto>[]);
  }
}
