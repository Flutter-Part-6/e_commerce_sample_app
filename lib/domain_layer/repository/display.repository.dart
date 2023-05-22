import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/domain_layer/repository/repository.dart';

abstract class DisplayRepository extends Repository {
  // get collection list
  Future<List<Collection>> getCollectionsByStoreType({
    required String storeType,
    Map<String, String>? queries,
  });

  // get viewModule list
  Future<List<ViewModule>> getViewModulesByStoreTypeAndTabId({
    required bool isRefresh,
    required String storeType,
    required int tabId,
    required int page,
    // Map<String, String>? queries,
  });
}
