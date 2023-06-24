import '../../../../common/constants.dart';
import '../../base_usecase/remote.usecase.dart';
import '../../../model/display/collection/collection.model.dart';
import '../../../repository/display.repository.dart';

class GetCollectionsByMallType extends RemoteUsecase<DisplayRepository> {
  final Map<String, String>? params;
  final MallType mallType;

  GetCollectionsByMallType({required this.mallType, this.params});

  @override
  Future<List<Collection>> execute(DisplayRepository repository) async {
    final result = await repository.getCollectionsByMallType(
      mallType: mallType.name,
    );

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
