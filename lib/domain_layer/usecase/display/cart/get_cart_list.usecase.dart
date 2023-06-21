import '../../../model/display.model.dart';
import '../../../repository/display.repository.dart';
import '../../base_usecase/remote.usecase.dart';

class GetCartList extends RemoteUsecase<DisplayRepository> {
  GetCartList();

  @override
  Future<List<Cart>> execute(DisplayRepository repository) async {
    final result = await repository.getCartList();

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
