import '../../../repository/display.repository.dart';
import '../../base_usecase/remote.usecase.dart';

class ClearCartList extends RemoteUsecase<DisplayRepository> {
  ClearCartList();

  @override
  Future<bool> execute(DisplayRepository repository) async {
    final result = await repository.clearCartList();

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
