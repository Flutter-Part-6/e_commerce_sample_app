import '../../../model/display/view_module/view_module.model.dart';
import '../../../../common/constants.dart';
import '../../base_usecase/remote.usecase.dart';
import '../../../repository/display.repository.dart';

class GetViewModulesByMallTypeAndTabId
    extends RemoteUsecase<DisplayRepository> {
  final MallType mallType;
  final int tabId;
  final bool isRefresh;
  final Map<String, String>? params;

  GetViewModulesByMallTypeAndTabId({
    required this.mallType,
    required this.tabId,
    this.isRefresh = false,
    this.params,
  });

  @override
  Future<List<ViewModule>> execute(DisplayRepository repository) async {
    final int page = int.parse(params?['currentpage'] ?? '1');
    final result = await repository.getViewModulesByMallTypeAndTabId(
      isRefresh: isRefresh,
      mallType: mallType.name,
      tabId: tabId,
      page: page,
    );

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
