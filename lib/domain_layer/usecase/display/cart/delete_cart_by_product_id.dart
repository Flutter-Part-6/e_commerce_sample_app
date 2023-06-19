import '../../../repository/display.repository.dart';
import '../../base_usecase/remote.usecase.dart';

class DeleteCartByProductId extends RemoteUsecase<DisplayRepository> {
  final List<String> productIds;

  DeleteCartByProductId({required this.productIds});

  @override
  Future<bool> execute(DisplayRepository repository) async {
    final result = await repository.deleteCart(productIds);

    return result.when(
      success: (result) => result,
      error: (error, msg) => throw error,
    );
  }
}
