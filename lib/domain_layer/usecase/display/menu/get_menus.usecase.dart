import '../../../../common/constants.dart';
import '../../../model/display.model.dart';
import '../../base_usecase/remote.usecase.dart';
import '../../../repository/display.repository.dart';

class GetMenus extends RemoteUsecase<DisplayRepository> {
  final Map<String, String>? params;
  final MallType mallType;

  GetMenus({required this.mallType, this.params});

  @override
  Future<List<Menu>> execute(DisplayRepository repository) async {
    final result = await repository.getMenusByMallType(mallType: mallType.name);

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
