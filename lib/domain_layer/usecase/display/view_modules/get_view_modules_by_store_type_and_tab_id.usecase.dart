import 'package:sample_app/domain_layer/model/display/view_module/view_module.model.dart';

import '../../../../common/constants.dart';
import '../../base_usecase/remote.usecase.dart';

import 'package:sample_app/domain_layer/repository/display.repository.dart';

class GetViewModulesByStoreTypeAndTabId
    extends RemoteUsecase<DisplayRepository> {
  final StoreType storeType;
  final int tabId;
  final bool isRefresh;
  final Map<String, String>? params;

  GetViewModulesByStoreTypeAndTabId({
    required this.storeType,
    required this.tabId,
    this.isRefresh = false,
    this.params,
  });

  @override
  Future<List<ViewModule>> execute(DisplayRepository repository) async {
    final int page = int.parse(params?['currentpage'] ?? '1');

    return await repository.getViewModulesByStoreTypeAndTabId(
      isRefresh: isRefresh,
      storeType: storeType.name,
      tabId: tabId,
      page: page,
    );
  }
}
