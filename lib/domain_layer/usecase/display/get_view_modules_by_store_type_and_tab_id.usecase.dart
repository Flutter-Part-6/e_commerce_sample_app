import 'package:sample_app/data_layer/common/mapper/display.mapper.dart';
import 'package:sample_app/domain_layer/model/display/view_module/view_module.model.dart';

import '../../../data_layer/data_source/local_storage/display_dao.dart';
import '../../../data_layer/entity/display/view_module/view_module.entity.dart';
import '../../../presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';
import '../base_usecase/remote.usecase.dart';

import 'package:sample_app/domain_layer/repository/display.repository.dart';

class GetViewModulesByStoreTypeAndTabId
    extends RemoteUsecase<DisplayRepository> {
  GetViewModulesByStoreTypeAndTabId({
    required this.storeType,
    required this.tabId,
    this.params,
  });

  final Map<String, String>? params;
  final StoreType storeType;
  final int tabId;

  @override
  Future<List<ViewModule>> execute(DisplayRepository repository) async {
    final displayDao = DisplayDao();

    final cacheKey = '${storeType}_$tabId';
    final List<ViewModuleEntity> cachedViewModules =
        await displayDao.getViewModules(cacheKey);

    //TODO refresh인 경우 개발해야 됌
    if (cachedViewModules.isNotEmpty) {
      final viewModules = cachedViewModules
          .map((viewModuleEntity) => viewModuleEntity.toModel())
          .toList();
      return viewModules;
    }

    final response = await repository.getViewModulesByStoreTypeAndTabId(
      storeType: storeType.name,
      tabId: tabId,
    );

    // delete cache
    await displayDao.clearViewModules(cacheKey);

    // insert local_storage
    await displayDao.insertViewModules(
        cacheKey, response.map((e) => e.toEntity()).toList());

    return response;
  }
}
