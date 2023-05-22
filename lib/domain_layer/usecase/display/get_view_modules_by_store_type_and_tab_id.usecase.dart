import 'package:sample_app/domain_layer/model/display/view_module/view_module.model.dart';

import '../../../presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';
import '../base_usecase/remote.usecase.dart';

import 'package:sample_app/domain_layer/repository/display.repository.dart';

class GetViewModulesByStoreTypeAndTabId
    extends RemoteUsecase<DisplayRepository> {
  GetViewModulesByStoreTypeAndTabId({
    required this.storeType,
    required this.tabId,
    this.isRefresh = false,
    this.params,
  });

  final StoreType storeType;
  final int tabId;
  final bool isRefresh;
  final Map<String, String>? params;

  @override
  Future<List<ViewModule>> execute(DisplayRepository repository) async {
    final int page = int.parse(params?['currentpage'] ?? '1');
    final response = await repository.getViewModulesByStoreTypeAndTabId(
      isRefresh: isRefresh,
      storeType: storeType.name,
      tabId: tabId,
      page: page,
    );

    return response;
  }
}
